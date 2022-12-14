\m4_TLV_version 1d --bestsv --noline: tl-x.org
\SV
   /*
   Copyright 2022 Redwood EDA
   
   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
   
   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
   
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
   */
m4+definitions(['
   m4_def(IMEM_STYLE, EXTERN)
   m4_def(DMEM_STYLE, EXTERN)
   m4_def(ISA, RISCV)
   m4_def(EXT_E, 0)
   m4_def(EXT_M, 0)
   m4_def(EXT_F, 0)
   m4_def(EXT_B, 0)
   m4_def(NUM_CORES, 1)
   m4_def(NUM_VCS, 2)
   m4_def(NUM_PRIOS, 2)
   m4_def(MAX_PACKET_SIZE, 8)
   m4_def(soft_reset, 1'b0)
   m4_def(cpu_blocked, 1'b0)
   m4_def(BRANCH_PRED, two_bit)
   m4_def(EXTRA_REPLAY_BUBBLE, 0)
   m4_def(EXTRA_PRED_TAKEN_BUBBLE, 0)
   m4_def(EXTRA_JUMP_BUBBLE, 0)
   m4_def(EXTRA_BRANCH_BUBBLE, 0)
   m4_def(EXTRA_INDIRECT_JUMP_BUBBLE, 0)
   m4_def(EXTRA_NON_PIPELINED_BUBBLE, 1)
   m4_def(EXTRA_TRAP_BUBBLE, 1)
   m4_def(NEXT_PC_STAGE, 0)
   m4_def(FETCH_STAGE, 0)
   m4_def(DECODE_STAGE, 1)
   m4_def(BRANCH_PRED_STAGE, 1)
   m4_def(REG_RD_STAGE, 1)
   m4_def(EXECUTE_STAGE, 2)
   m4_def(RESULT_STAGE, 2)
   m4_def(REG_WR_STAGE, 3)
   m4_def(MEM_WR_STAGE, 3)
   m4_def(LD_RETURN_ALIGN, 4)
'])
\SV
   // Include WARP-V.
   
   m4_include_lib(['https://raw.githubusercontent.com/ALI11-2000/warp-v/1d9674ce50e970dbbe0d01d29e10fe2cba86c7fe/warp-v.tlv'])
                   
   m4_ifelse(M4_MAKERCHIP,1,['
   m4_sv_get_url(['https://raw.githubusercontent.com/ALI11-2000/mpw-waprv/main/verilog/rtl/sky130_sram_1kbyte_1rw1r_32x256_8.v'])
   m4_sv_get_url(['https://raw.githubusercontent.com/ALI11-2000/mpw-waprv/699c8bfee4668d8ef603e29822cd014138ace14c/verilog/rtl/imem.hex'])
   
	m4_makerchip_module
   	logic [31:0] dmem_addra;
      logic [31:0] dmem_addrb;
      logic [31:0] dmem_dina ;
      logic [31:0] dmem_dinb ;
      logic [3:0]  dmem_wea  ;
      logic        dmem_wea0 ;
      logic [3:0]  dmem_web  ;
      logic        dmem_ena  ;
      logic        dmem_enb  ;
      logic [31:0] dmem_doutb;
      logic [31:0] imem_addr ;
      logic [31:0] imem_data ;
      logic        clk_h;
                  
      warpv_core dut( dmem_addra,
                      dmem_addrb,
                      dmem_dina ,
                      dmem_dinb ,
                      dmem_wea  ,
                      dmem_wea0 ,
                      dmem_web  ,
                      dmem_ena  ,
                      dmem_enb  ,
                      dmem_doutb,
                      imem_addr ,
                      imem_data ,
                      clk, reset);
                  
     sky130_sram_1kbyte_1rw1r_32x256_8 imem(
        .clk0(clk),.csb0(1'b1),.web0('0),.wmask0('0),.addr0('0),.din0('0),.dout0(),
        .clk1(clk),.csb1(1'b0),.addr1(imem_addr),.dout1(imem_data)
      );
     
     sky130_sram_1kbyte_1rw1r_32x256_8 dmem(
        .clk0(clk),.csb0(dmem_ena),.web0(dmem_wea0),.wmask0(dmem_wea),
        .addr0(dmem_addra),.din0(dmem_dina), .dout0(),
        .clk1(clk),.csb1(dmem_enb),.addr1(dmem_addrb),.dout1(dmem_doutb)
    );
     initial
   	begin
      clk_h = 1;
   	$display("Loading RAM from %0s", "./sv_url_inc/imem.hex");
   	$readmemh("./sv_url_inc/imem.hex", imem.mem);
   	end
                  
     always_ff@(posedge clk) begin
         clk_h = !clk_h;
      end
           
   endmodule
   '])
                   
	module warpv_core( output [31:0] dmem_addra,
                      output [31:0] dmem_addrb,
                      output [31:0] dmem_dina ,
                      output [31:0] dmem_dinb ,
                      output [3:0]  dmem_wea  ,
                      output        dmem_wea0 ,
                      output [3:0]  dmem_web  ,
                      output        dmem_ena  ,
                      output        dmem_enb  ,
                      input  [31:0] dmem_doutb,
                      output [31:0] imem_addr ,
                      input  [31:0] imem_data,
                      input         clk, reset);

\TLV
   m4+cpu(/top)
   m4+cpu_viz(|fetch, "#7AD7F0")
\SV
   endmodule
