// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // wire Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/
wire [31:0] dmem_addra;
wire [31:0] dmem_addrb;
wire [31:0] dmem_dina ;
wire [31:0] dmem_dinb ;
wire [3:0]  dmem_wea  ;
wire        dmem_wea0 ;
wire [3:0]  dmem_web  ;
wire        dmem_ena  ;
wire        dmem_enb  ;
wire [31:0] dmem_doutb;
wire [31:0] imem_addr ;
wire [31:0] imem_data ;
wire        clk_h;
wire        clk0;
wire        csb0;
wire        processor_reset;
wire        web0;
wire        imem_rd_cs1;
wire [3:0]  wmask0;
wire [31:0] din0;
wire [8:0]  addr0;
wire [7:0]  dmem_addrb_o;
                  
warpv_core core( 
    .dmem_addra(dmem_addra     ) ,
    .dmem_addrb(dmem_addrb     ) ,
    .dmem_dina (dmem_dina      ) ,
    .dmem_dinb (dmem_dinb      ) ,
    .dmem_wea  (dmem_wea       ) ,
    .dmem_wea0 (dmem_wea0      ) ,
    .dmem_web  (dmem_web       ) ,
    .dmem_ena  (dmem_ena       ) ,
    .dmem_enb  (dmem_enb       ) ,
    .dmem_doutb(dmem_doutb     ) ,
    .imem_addr (imem_addr      ) ,
    .imem_data (imem_data      ) ,
    .clk       (wb_clk_i       ) , 
    .reset     (processor_reset));
                  
sky130_sram_1kbyte_1rw1r_32x256_8 imem(
   `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1),
  `endif
   .clk0(wb_clk_i),.csb0(csb0),.web0(web0),.wmask0(wmask0),.addr0(addr0),.din0(din0),
   .clk1(wb_clk_i),.csb1(imem_rd_cs1),.addr1(imem_addr[7:0]),.dout1(imem_data)
);

sky130_sram_1kbyte_1rw1r_32x256_8 dmem(
    `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1),
  `endif
   .clk0(wb_clk_i),.csb0(dmem_ena),.web0(dmem_wea0),.wmask0(dmem_wea),
   .addr0(dmem_addra[7:0]),.din0(dmem_dina),
   .clk1(wb_clk_i),.csb1(dmem_enb),.addr1(dmem_addrb_o[7:0]),.dout1(dmem_doutb)
);

wb_interface wbs_int(
    .wb_clk_i       (wb_clk_i       ),
    .wb_rst_i       (wb_rst_i       ),
    .wbs_stb_i      (wbs_stb_i      ),
    .wbs_cyc_i      (wbs_cyc_i      ),
    .wbs_we_i       (wbs_we_i       ),
    .wbs_sel_i      (wbs_sel_i      ),
    .wbs_dat_i      (wbs_dat_i      ),
    .wbs_adr_i      (wbs_adr_i      ),
    .dmem_enb       (dmem_enb       ),
    .dmem_addrb     (dmem_addrb[7:0]),
    .dmem_doutb     (dmem_doutb     ),
    .clk0           (clk0           ),
    .csb0           (csb0           ),
    .web0           (web0           ),
    .wmask0         (wmask0         ),
    .din0           (din0           ),
    .addr0          (addr0          ),
    .imem_rd_cs1    (imem_rd_cs1    ),
    .wbs_ack_o      (wbs_ack_o      ),
    .dmem_addrb_o   (dmem_addrb_o   ),
    .wbs_dat_o      (wbs_dat_o      ),
    .processor_reset(processor_reset)
    );

assign la_data_out[39:0]   = {dmem_addra[7:0],dmem_dina};
assign la_data_out[111:72] = {addr0, din0};
assign io_out[37:6]        = dmem_doutb;
endmodule	// user_project_wrapper

`default_nettype wire
