\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template

   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
	m4_ifelse(M4_MAKERCHIP,1,['
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
   logic wb_clk_i;
logic wb_rst_i;
logic wbs_stb_i;
logic wbs_cyc_i;
logic wbs_we_i;
logic [3:0] wbs_sel_i;
logic [31:0] wbs_dat_i;
logic [31:0] wbs_adr_i;
logic dmem_enb;
logic [7:0] dmem_addrb;
logic [31:0] dmem_doutb;
logic clk0;
logic csb0;
logic web0;
logic [3:0] wmask0;
logic [31:0] din0;
logic [9:0]  addr0;
logic wbs_ack_o;
logic [7:0] dmem_addrb_o;
logic [31:0] wbs_dat_o;
logic processor_reset;
logic imem_rd_cs1;
                             
	 wb_interface dut (clk,
              wb_rst_i,
              wbs_stb_i,
              wbs_cyc_i,
              wbs_we_i,
              wbs_sel_i,
               wbs_dat_i,
               wbs_adr_i,
               dmem_enb,
               dmem_addrb,
               dmem_doutb,
               clk0,
               csb0,
               web0,
               wmask0,
                din0,
                addr0,
               imem_rd_cs1,
               wbs_ack_o,
               dmem_addrb_o,
               wbs_dat_o,
               processor_reset);

	endmodule
   '])

   module wb_interface(input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    input dmem_enb, 
    input [7:0] dmem_addrb, 
    input [31:0] dmem_doutb,
    output clk0,
    output csb0,
    output web0,
    output [3:0] wmask0,
    output [31:0] din0,
    output [8:0]  addr0,
    output imem_rd_cs1,
    output wbs_ack_o,
    output [7:0] dmem_addrb_o,
    output [31:0] wbs_dat_o,
    output processor_reset);
   
   wire clk;
   assign clk = wb_clk_i;
\TLV
   *wbs_dat_o = *dmem_doutb;
   *dmem_addrb_o = *dmem_enb ? *wbs_adr_i[7:0] : *dmem_addrb;
   $valid_addr = *wbs_adr_i[31:11] == 21'b0011_0000_0000_0000_0000_0;
   *processor_reset = ((*wbs_adr_i[31:28] == 4'h3) && (*wbs_adr_i[11] == 1)) ? *wbs_dat_i[0] : '0;
   $valid = *wbs_cyc_i && *wbs_stb_i;
   $ready = $valid && !>>1$ready;
   *clk0 = *wb_clk_i;
   *csb0 = ($valid_addr && $valid) ? '0 : '1;
   *web0  = !*wbs_we_i;
   *wmask0 = *wbs_sel_i & {4{*wbs_we_i}};
   *din0 = *wbs_dat_i;
   *addr0 = *wbs_adr_i[10:2];
   *wbs_ack_o = $ready;
   *imem_rd_cs1 = '0;
\SV
   endmodule