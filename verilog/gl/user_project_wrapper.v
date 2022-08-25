module user_project_wrapper (user_clock2,
    vccd1,
    vccd2,
    vdda1,
    vdda2,
    vssa1,
    vssa2,
    vssd1,
    vssd2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vccd1;
 input vccd2;
 input vdda1;
 input vdda2;
 input vssa1;
 input vssa2;
 input vssd1;
 input vssd2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire \addr0[0] ;
 wire \addr0[1] ;
 wire \addr0[2] ;
 wire \addr0[3] ;
 wire \addr0[4] ;
 wire \addr0[5] ;
 wire \addr0[6] ;
 wire \addr0[7] ;
 wire \addr0[8] ;
 wire clk0;
 wire csb0;
 wire \din0[0] ;
 wire \din0[10] ;
 wire \din0[11] ;
 wire \din0[12] ;
 wire \din0[13] ;
 wire \din0[14] ;
 wire \din0[15] ;
 wire \din0[16] ;
 wire \din0[17] ;
 wire \din0[18] ;
 wire \din0[19] ;
 wire \din0[1] ;
 wire \din0[20] ;
 wire \din0[21] ;
 wire \din0[22] ;
 wire \din0[23] ;
 wire \din0[24] ;
 wire \din0[25] ;
 wire \din0[26] ;
 wire \din0[27] ;
 wire \din0[28] ;
 wire \din0[29] ;
 wire \din0[2] ;
 wire \din0[30] ;
 wire \din0[31] ;
 wire \din0[3] ;
 wire \din0[4] ;
 wire \din0[5] ;
 wire \din0[6] ;
 wire \din0[7] ;
 wire \din0[8] ;
 wire \din0[9] ;
 wire \dmem_addra[0] ;
 wire \dmem_addra[10] ;
 wire \dmem_addra[11] ;
 wire \dmem_addra[12] ;
 wire \dmem_addra[13] ;
 wire \dmem_addra[14] ;
 wire \dmem_addra[15] ;
 wire \dmem_addra[16] ;
 wire \dmem_addra[17] ;
 wire \dmem_addra[18] ;
 wire \dmem_addra[19] ;
 wire \dmem_addra[1] ;
 wire \dmem_addra[20] ;
 wire \dmem_addra[21] ;
 wire \dmem_addra[22] ;
 wire \dmem_addra[23] ;
 wire \dmem_addra[24] ;
 wire \dmem_addra[25] ;
 wire \dmem_addra[26] ;
 wire \dmem_addra[27] ;
 wire \dmem_addra[28] ;
 wire \dmem_addra[29] ;
 wire \dmem_addra[2] ;
 wire \dmem_addra[30] ;
 wire \dmem_addra[31] ;
 wire \dmem_addra[3] ;
 wire \dmem_addra[4] ;
 wire \dmem_addra[5] ;
 wire \dmem_addra[6] ;
 wire \dmem_addra[7] ;
 wire \dmem_addra[8] ;
 wire \dmem_addra[9] ;
 wire \dmem_addrb[0] ;
 wire \dmem_addrb[10] ;
 wire \dmem_addrb[11] ;
 wire \dmem_addrb[12] ;
 wire \dmem_addrb[13] ;
 wire \dmem_addrb[14] ;
 wire \dmem_addrb[15] ;
 wire \dmem_addrb[16] ;
 wire \dmem_addrb[17] ;
 wire \dmem_addrb[18] ;
 wire \dmem_addrb[19] ;
 wire \dmem_addrb[1] ;
 wire \dmem_addrb[20] ;
 wire \dmem_addrb[21] ;
 wire \dmem_addrb[22] ;
 wire \dmem_addrb[23] ;
 wire \dmem_addrb[24] ;
 wire \dmem_addrb[25] ;
 wire \dmem_addrb[26] ;
 wire \dmem_addrb[27] ;
 wire \dmem_addrb[28] ;
 wire \dmem_addrb[29] ;
 wire \dmem_addrb[2] ;
 wire \dmem_addrb[30] ;
 wire \dmem_addrb[31] ;
 wire \dmem_addrb[3] ;
 wire \dmem_addrb[4] ;
 wire \dmem_addrb[5] ;
 wire \dmem_addrb[6] ;
 wire \dmem_addrb[7] ;
 wire \dmem_addrb[8] ;
 wire \dmem_addrb[9] ;
 wire \dmem_dina[0] ;
 wire \dmem_dina[10] ;
 wire \dmem_dina[11] ;
 wire \dmem_dina[12] ;
 wire \dmem_dina[13] ;
 wire \dmem_dina[14] ;
 wire \dmem_dina[15] ;
 wire \dmem_dina[16] ;
 wire \dmem_dina[17] ;
 wire \dmem_dina[18] ;
 wire \dmem_dina[19] ;
 wire \dmem_dina[1] ;
 wire \dmem_dina[20] ;
 wire \dmem_dina[21] ;
 wire \dmem_dina[22] ;
 wire \dmem_dina[23] ;
 wire \dmem_dina[24] ;
 wire \dmem_dina[25] ;
 wire \dmem_dina[26] ;
 wire \dmem_dina[27] ;
 wire \dmem_dina[28] ;
 wire \dmem_dina[29] ;
 wire \dmem_dina[2] ;
 wire \dmem_dina[30] ;
 wire \dmem_dina[31] ;
 wire \dmem_dina[3] ;
 wire \dmem_dina[4] ;
 wire \dmem_dina[5] ;
 wire \dmem_dina[6] ;
 wire \dmem_dina[7] ;
 wire \dmem_dina[8] ;
 wire \dmem_dina[9] ;
 wire \dmem_dinb[0] ;
 wire \dmem_dinb[10] ;
 wire \dmem_dinb[11] ;
 wire \dmem_dinb[12] ;
 wire \dmem_dinb[13] ;
 wire \dmem_dinb[14] ;
 wire \dmem_dinb[15] ;
 wire \dmem_dinb[16] ;
 wire \dmem_dinb[17] ;
 wire \dmem_dinb[18] ;
 wire \dmem_dinb[19] ;
 wire \dmem_dinb[1] ;
 wire \dmem_dinb[20] ;
 wire \dmem_dinb[21] ;
 wire \dmem_dinb[22] ;
 wire \dmem_dinb[23] ;
 wire \dmem_dinb[24] ;
 wire \dmem_dinb[25] ;
 wire \dmem_dinb[26] ;
 wire \dmem_dinb[27] ;
 wire \dmem_dinb[28] ;
 wire \dmem_dinb[29] ;
 wire \dmem_dinb[2] ;
 wire \dmem_dinb[30] ;
 wire \dmem_dinb[31] ;
 wire \dmem_dinb[3] ;
 wire \dmem_dinb[4] ;
 wire \dmem_dinb[5] ;
 wire \dmem_dinb[6] ;
 wire \dmem_dinb[7] ;
 wire \dmem_dinb[8] ;
 wire \dmem_dinb[9] ;
 wire \dmem_doutb[0] ;
 wire \dmem_doutb[10] ;
 wire \dmem_doutb[11] ;
 wire \dmem_doutb[12] ;
 wire \dmem_doutb[13] ;
 wire \dmem_doutb[14] ;
 wire \dmem_doutb[15] ;
 wire \dmem_doutb[16] ;
 wire \dmem_doutb[17] ;
 wire \dmem_doutb[18] ;
 wire \dmem_doutb[19] ;
 wire \dmem_doutb[1] ;
 wire \dmem_doutb[20] ;
 wire \dmem_doutb[21] ;
 wire \dmem_doutb[22] ;
 wire \dmem_doutb[23] ;
 wire \dmem_doutb[24] ;
 wire \dmem_doutb[25] ;
 wire \dmem_doutb[26] ;
 wire \dmem_doutb[27] ;
 wire \dmem_doutb[28] ;
 wire \dmem_doutb[29] ;
 wire \dmem_doutb[2] ;
 wire \dmem_doutb[30] ;
 wire \dmem_doutb[31] ;
 wire \dmem_doutb[3] ;
 wire \dmem_doutb[4] ;
 wire \dmem_doutb[5] ;
 wire \dmem_doutb[6] ;
 wire \dmem_doutb[7] ;
 wire \dmem_doutb[8] ;
 wire \dmem_doutb[9] ;
 wire dmem_ena;
 wire dmem_enb;
 wire dmem_wea0;
 wire \dmem_wea[0] ;
 wire \dmem_wea[1] ;
 wire \dmem_wea[2] ;
 wire \dmem_wea[3] ;
 wire \dmem_web[0] ;
 wire \dmem_web[1] ;
 wire \dmem_web[2] ;
 wire \dmem_web[3] ;
 wire \imem_addr[0] ;
 wire \imem_addr[10] ;
 wire \imem_addr[11] ;
 wire \imem_addr[12] ;
 wire \imem_addr[13] ;
 wire \imem_addr[14] ;
 wire \imem_addr[15] ;
 wire \imem_addr[16] ;
 wire \imem_addr[17] ;
 wire \imem_addr[18] ;
 wire \imem_addr[19] ;
 wire \imem_addr[1] ;
 wire \imem_addr[20] ;
 wire \imem_addr[21] ;
 wire \imem_addr[22] ;
 wire \imem_addr[23] ;
 wire \imem_addr[24] ;
 wire \imem_addr[25] ;
 wire \imem_addr[26] ;
 wire \imem_addr[27] ;
 wire \imem_addr[28] ;
 wire \imem_addr[29] ;
 wire \imem_addr[2] ;
 wire \imem_addr[30] ;
 wire \imem_addr[31] ;
 wire \imem_addr[3] ;
 wire \imem_addr[4] ;
 wire \imem_addr[5] ;
 wire \imem_addr[6] ;
 wire \imem_addr[7] ;
 wire \imem_addr[8] ;
 wire \imem_addr[9] ;
 wire \imem_data[0] ;
 wire \imem_data[10] ;
 wire \imem_data[11] ;
 wire \imem_data[12] ;
 wire \imem_data[13] ;
 wire \imem_data[14] ;
 wire \imem_data[15] ;
 wire \imem_data[16] ;
 wire \imem_data[17] ;
 wire \imem_data[18] ;
 wire \imem_data[19] ;
 wire \imem_data[1] ;
 wire \imem_data[20] ;
 wire \imem_data[21] ;
 wire \imem_data[22] ;
 wire \imem_data[23] ;
 wire \imem_data[24] ;
 wire \imem_data[25] ;
 wire \imem_data[26] ;
 wire \imem_data[27] ;
 wire \imem_data[28] ;
 wire \imem_data[29] ;
 wire \imem_data[2] ;
 wire \imem_data[30] ;
 wire \imem_data[31] ;
 wire \imem_data[3] ;
 wire \imem_data[4] ;
 wire \imem_data[5] ;
 wire \imem_data[6] ;
 wire \imem_data[7] ;
 wire \imem_data[8] ;
 wire \imem_data[9] ;
 wire imem_rd_cs1;
 wire processor_reset;
 wire web0;
 wire \wmask0[0] ;
 wire \wmask0[1] ;
 wire \wmask0[2] ;
 wire \wmask0[3] ;

 warpv_core core (.clk(wb_clk_i),
    .dmem_ena(dmem_ena),
    .dmem_enb(dmem_enb),
    .dmem_wea0(dmem_wea0),
    .reset(processor_reset),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .dmem_addra({\dmem_addra[31] ,
    \dmem_addra[30] ,
    \dmem_addra[29] ,
    \dmem_addra[28] ,
    \dmem_addra[27] ,
    \dmem_addra[26] ,
    \dmem_addra[25] ,
    \dmem_addra[24] ,
    \dmem_addra[23] ,
    \dmem_addra[22] ,
    \dmem_addra[21] ,
    \dmem_addra[20] ,
    \dmem_addra[19] ,
    \dmem_addra[18] ,
    \dmem_addra[17] ,
    \dmem_addra[16] ,
    \dmem_addra[15] ,
    \dmem_addra[14] ,
    \dmem_addra[13] ,
    \dmem_addra[12] ,
    \dmem_addra[11] ,
    \dmem_addra[10] ,
    \dmem_addra[9] ,
    \dmem_addra[8] ,
    \dmem_addra[7] ,
    \dmem_addra[6] ,
    \dmem_addra[5] ,
    \dmem_addra[4] ,
    \dmem_addra[3] ,
    \dmem_addra[2] ,
    \dmem_addra[1] ,
    \dmem_addra[0] }),
    .dmem_addrb({\dmem_addrb[31] ,
    \dmem_addrb[30] ,
    \dmem_addrb[29] ,
    \dmem_addrb[28] ,
    \dmem_addrb[27] ,
    \dmem_addrb[26] ,
    \dmem_addrb[25] ,
    \dmem_addrb[24] ,
    \dmem_addrb[23] ,
    \dmem_addrb[22] ,
    \dmem_addrb[21] ,
    \dmem_addrb[20] ,
    \dmem_addrb[19] ,
    \dmem_addrb[18] ,
    \dmem_addrb[17] ,
    \dmem_addrb[16] ,
    \dmem_addrb[15] ,
    \dmem_addrb[14] ,
    \dmem_addrb[13] ,
    \dmem_addrb[12] ,
    \dmem_addrb[11] ,
    \dmem_addrb[10] ,
    \dmem_addrb[9] ,
    \dmem_addrb[8] ,
    \dmem_addrb[7] ,
    \dmem_addrb[6] ,
    \dmem_addrb[5] ,
    \dmem_addrb[4] ,
    \dmem_addrb[3] ,
    \dmem_addrb[2] ,
    \dmem_addrb[1] ,
    \dmem_addrb[0] }),
    .dmem_dina({\dmem_dina[31] ,
    \dmem_dina[30] ,
    \dmem_dina[29] ,
    \dmem_dina[28] ,
    \dmem_dina[27] ,
    \dmem_dina[26] ,
    \dmem_dina[25] ,
    \dmem_dina[24] ,
    \dmem_dina[23] ,
    \dmem_dina[22] ,
    \dmem_dina[21] ,
    \dmem_dina[20] ,
    \dmem_dina[19] ,
    \dmem_dina[18] ,
    \dmem_dina[17] ,
    \dmem_dina[16] ,
    \dmem_dina[15] ,
    \dmem_dina[14] ,
    \dmem_dina[13] ,
    \dmem_dina[12] ,
    \dmem_dina[11] ,
    \dmem_dina[10] ,
    \dmem_dina[9] ,
    \dmem_dina[8] ,
    \dmem_dina[7] ,
    \dmem_dina[6] ,
    \dmem_dina[5] ,
    \dmem_dina[4] ,
    \dmem_dina[3] ,
    \dmem_dina[2] ,
    \dmem_dina[1] ,
    \dmem_dina[0] }),
    .dmem_dinb({\dmem_dinb[31] ,
    \dmem_dinb[30] ,
    \dmem_dinb[29] ,
    \dmem_dinb[28] ,
    \dmem_dinb[27] ,
    \dmem_dinb[26] ,
    \dmem_dinb[25] ,
    \dmem_dinb[24] ,
    \dmem_dinb[23] ,
    \dmem_dinb[22] ,
    \dmem_dinb[21] ,
    \dmem_dinb[20] ,
    \dmem_dinb[19] ,
    \dmem_dinb[18] ,
    \dmem_dinb[17] ,
    \dmem_dinb[16] ,
    \dmem_dinb[15] ,
    \dmem_dinb[14] ,
    \dmem_dinb[13] ,
    \dmem_dinb[12] ,
    \dmem_dinb[11] ,
    \dmem_dinb[10] ,
    \dmem_dinb[9] ,
    \dmem_dinb[8] ,
    \dmem_dinb[7] ,
    \dmem_dinb[6] ,
    \dmem_dinb[5] ,
    \dmem_dinb[4] ,
    \dmem_dinb[3] ,
    \dmem_dinb[2] ,
    \dmem_dinb[1] ,
    \dmem_dinb[0] }),
    .dmem_doutb({\dmem_doutb[31] ,
    \dmem_doutb[30] ,
    \dmem_doutb[29] ,
    \dmem_doutb[28] ,
    \dmem_doutb[27] ,
    \dmem_doutb[26] ,
    \dmem_doutb[25] ,
    \dmem_doutb[24] ,
    \dmem_doutb[23] ,
    \dmem_doutb[22] ,
    \dmem_doutb[21] ,
    \dmem_doutb[20] ,
    \dmem_doutb[19] ,
    \dmem_doutb[18] ,
    \dmem_doutb[17] ,
    \dmem_doutb[16] ,
    \dmem_doutb[15] ,
    \dmem_doutb[14] ,
    \dmem_doutb[13] ,
    \dmem_doutb[12] ,
    \dmem_doutb[11] ,
    \dmem_doutb[10] ,
    \dmem_doutb[9] ,
    \dmem_doutb[8] ,
    \dmem_doutb[7] ,
    \dmem_doutb[6] ,
    \dmem_doutb[5] ,
    \dmem_doutb[4] ,
    \dmem_doutb[3] ,
    \dmem_doutb[2] ,
    \dmem_doutb[1] ,
    \dmem_doutb[0] }),
    .dmem_wea({\dmem_wea[3] ,
    \dmem_wea[2] ,
    \dmem_wea[1] ,
    \dmem_wea[0] }),
    .dmem_web({\dmem_web[3] ,
    \dmem_web[2] ,
    \dmem_web[1] ,
    \dmem_web[0] }),
    .imem_addr({\imem_addr[31] ,
    \imem_addr[30] ,
    \imem_addr[29] ,
    \imem_addr[28] ,
    \imem_addr[27] ,
    \imem_addr[26] ,
    \imem_addr[25] ,
    \imem_addr[24] ,
    \imem_addr[23] ,
    \imem_addr[22] ,
    \imem_addr[21] ,
    \imem_addr[20] ,
    \imem_addr[19] ,
    \imem_addr[18] ,
    \imem_addr[17] ,
    \imem_addr[16] ,
    \imem_addr[15] ,
    \imem_addr[14] ,
    \imem_addr[13] ,
    \imem_addr[12] ,
    \imem_addr[11] ,
    \imem_addr[10] ,
    \imem_addr[9] ,
    \imem_addr[8] ,
    \imem_addr[7] ,
    \imem_addr[6] ,
    \imem_addr[5] ,
    \imem_addr[4] ,
    \imem_addr[3] ,
    \imem_addr[2] ,
    \imem_addr[1] ,
    \imem_addr[0] }),
    .imem_data({\imem_data[31] ,
    \imem_data[30] ,
    \imem_data[29] ,
    \imem_data[28] ,
    \imem_data[27] ,
    \imem_data[26] ,
    \imem_data[25] ,
    \imem_data[24] ,
    \imem_data[23] ,
    \imem_data[22] ,
    \imem_data[21] ,
    \imem_data[20] ,
    \imem_data[19] ,
    \imem_data[18] ,
    \imem_data[17] ,
    \imem_data[16] ,
    \imem_data[15] ,
    \imem_data[14] ,
    \imem_data[13] ,
    \imem_data[12] ,
    \imem_data[11] ,
    \imem_data[10] ,
    \imem_data[9] ,
    \imem_data[8] ,
    \imem_data[7] ,
    \imem_data[6] ,
    \imem_data[5] ,
    \imem_data[4] ,
    \imem_data[3] ,
    \imem_data[2] ,
    \imem_data[1] ,
    \imem_data[0] }));
 sky130_sram_1kbyte_1rw1r_32x256_8 dmem (.csb0(dmem_ena),
    .csb1(dmem_enb),
    .web0(dmem_wea0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\dmem_addra[7] ,
    \dmem_addra[6] ,
    \dmem_addra[5] ,
    \dmem_addra[4] ,
    \dmem_addra[3] ,
    \dmem_addra[2] ,
    \dmem_addra[1] ,
    \dmem_addra[0] }),
    .addr1({\dmem_addrb[7] ,
    \dmem_addrb[6] ,
    \dmem_addrb[5] ,
    \dmem_addrb[4] ,
    \dmem_addrb[3] ,
    \dmem_addrb[2] ,
    \dmem_addrb[1] ,
    \dmem_addrb[0] }),
    .din0({\dmem_dina[31] ,
    \dmem_dina[30] ,
    \dmem_dina[29] ,
    \dmem_dina[28] ,
    \dmem_dina[27] ,
    \dmem_dina[26] ,
    \dmem_dina[25] ,
    \dmem_dina[24] ,
    \dmem_dina[23] ,
    \dmem_dina[22] ,
    \dmem_dina[21] ,
    \dmem_dina[20] ,
    \dmem_dina[19] ,
    \dmem_dina[18] ,
    \dmem_dina[17] ,
    \dmem_dina[16] ,
    \dmem_dina[15] ,
    \dmem_dina[14] ,
    \dmem_dina[13] ,
    \dmem_dina[12] ,
    \dmem_dina[11] ,
    \dmem_dina[10] ,
    \dmem_dina[9] ,
    \dmem_dina[8] ,
    \dmem_dina[7] ,
    \dmem_dina[6] ,
    \dmem_dina[5] ,
    \dmem_dina[4] ,
    \dmem_dina[3] ,
    \dmem_dina[2] ,
    \dmem_dina[1] ,
    \dmem_dina[0] }),
    .dout0({_NC1,
    _NC2,
    _NC3,
    _NC4,
    _NC5,
    _NC6,
    _NC7,
    _NC8,
    _NC9,
    _NC10,
    _NC11,
    _NC12,
    _NC13,
    _NC14,
    _NC15,
    _NC16,
    _NC17,
    _NC18,
    _NC19,
    _NC20,
    _NC21,
    _NC22,
    _NC23,
    _NC24,
    _NC25,
    _NC26,
    _NC27,
    _NC28,
    _NC29,
    _NC30,
    _NC31,
    _NC32}),
    .dout1({\dmem_doutb[31] ,
    \dmem_doutb[30] ,
    \dmem_doutb[29] ,
    \dmem_doutb[28] ,
    \dmem_doutb[27] ,
    \dmem_doutb[26] ,
    \dmem_doutb[25] ,
    \dmem_doutb[24] ,
    \dmem_doutb[23] ,
    \dmem_doutb[22] ,
    \dmem_doutb[21] ,
    \dmem_doutb[20] ,
    \dmem_doutb[19] ,
    \dmem_doutb[18] ,
    \dmem_doutb[17] ,
    \dmem_doutb[16] ,
    \dmem_doutb[15] ,
    \dmem_doutb[14] ,
    \dmem_doutb[13] ,
    \dmem_doutb[12] ,
    \dmem_doutb[11] ,
    \dmem_doutb[10] ,
    \dmem_doutb[9] ,
    \dmem_doutb[8] ,
    \dmem_doutb[7] ,
    \dmem_doutb[6] ,
    \dmem_doutb[5] ,
    \dmem_doutb[4] ,
    \dmem_doutb[3] ,
    \dmem_doutb[2] ,
    \dmem_doutb[1] ,
    \dmem_doutb[0] }),
    .wmask0({\dmem_wea[3] ,
    \dmem_wea[2] ,
    \dmem_wea[1] ,
    \dmem_wea[0] }));
 sky130_sram_1kbyte_1rw1r_32x256_8 imem (.csb0(csb0),
    .csb1(imem_rd_cs1),
    .web0(web0),
    .clk0(wb_clk_i),
    .clk1(wb_clk_i),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .addr0({\addr0[7] ,
    \addr0[6] ,
    \addr0[5] ,
    \addr0[4] ,
    \addr0[3] ,
    \addr0[2] ,
    \addr0[1] ,
    \addr0[0] }),
    .addr1({\imem_addr[7] ,
    \imem_addr[6] ,
    \imem_addr[5] ,
    \imem_addr[4] ,
    \imem_addr[3] ,
    \imem_addr[2] ,
    \imem_addr[1] ,
    \imem_addr[0] }),
    .din0({\din0[31] ,
    \din0[30] ,
    \din0[29] ,
    \din0[28] ,
    \din0[27] ,
    \din0[26] ,
    \din0[25] ,
    \din0[24] ,
    \din0[23] ,
    \din0[22] ,
    \din0[21] ,
    \din0[20] ,
    \din0[19] ,
    \din0[18] ,
    \din0[17] ,
    \din0[16] ,
    \din0[15] ,
    \din0[14] ,
    \din0[13] ,
    \din0[12] ,
    \din0[11] ,
    \din0[10] ,
    \din0[9] ,
    \din0[8] ,
    \din0[7] ,
    \din0[6] ,
    \din0[5] ,
    \din0[4] ,
    \din0[3] ,
    \din0[2] ,
    \din0[1] ,
    \din0[0] }),
    .dout0({_NC33,
    _NC34,
    _NC35,
    _NC36,
    _NC37,
    _NC38,
    _NC39,
    _NC40,
    _NC41,
    _NC42,
    _NC43,
    _NC44,
    _NC45,
    _NC46,
    _NC47,
    _NC48,
    _NC49,
    _NC50,
    _NC51,
    _NC52,
    _NC53,
    _NC54,
    _NC55,
    _NC56,
    _NC57,
    _NC58,
    _NC59,
    _NC60,
    _NC61,
    _NC62,
    _NC63,
    _NC64}),
    .dout1({\imem_data[31] ,
    \imem_data[30] ,
    \imem_data[29] ,
    \imem_data[28] ,
    \imem_data[27] ,
    \imem_data[26] ,
    \imem_data[25] ,
    \imem_data[24] ,
    \imem_data[23] ,
    \imem_data[22] ,
    \imem_data[21] ,
    \imem_data[20] ,
    \imem_data[19] ,
    \imem_data[18] ,
    \imem_data[17] ,
    \imem_data[16] ,
    \imem_data[15] ,
    \imem_data[14] ,
    \imem_data[13] ,
    \imem_data[12] ,
    \imem_data[11] ,
    \imem_data[10] ,
    \imem_data[9] ,
    \imem_data[8] ,
    \imem_data[7] ,
    \imem_data[6] ,
    \imem_data[5] ,
    \imem_data[4] ,
    \imem_data[3] ,
    \imem_data[2] ,
    \imem_data[1] ,
    \imem_data[0] }),
    .wmask0({\wmask0[3] ,
    \wmask0[2] ,
    \wmask0[1] ,
    \wmask0[0] }));
 wb_interface wbs_int (.clk0(clk0),
    .csb0(csb0),
    .imem_rd_cs1(imem_rd_cs1),
    .processor_reset(processor_reset),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .web0(web0),
    .addr0({\addr0[8] ,
    \addr0[7] ,
    \addr0[6] ,
    \addr0[5] ,
    \addr0[4] ,
    \addr0[3] ,
    \addr0[2] ,
    \addr0[1] ,
    \addr0[0] }),
    .din0({\din0[31] ,
    \din0[30] ,
    \din0[29] ,
    \din0[28] ,
    \din0[27] ,
    \din0[26] ,
    \din0[25] ,
    \din0[24] ,
    \din0[23] ,
    \din0[22] ,
    \din0[21] ,
    \din0[20] ,
    \din0[19] ,
    \din0[18] ,
    \din0[17] ,
    \din0[16] ,
    \din0[15] ,
    \din0[14] ,
    \din0[13] ,
    \din0[12] ,
    \din0[11] ,
    \din0[10] ,
    \din0[9] ,
    \din0[8] ,
    \din0[7] ,
    \din0[6] ,
    \din0[5] ,
    \din0[4] ,
    \din0[3] ,
    \din0[2] ,
    \din0[1] ,
    \din0[0] }),
    .wbs_adr_i({wbs_adr_i[31],
    wbs_adr_i[30],
    wbs_adr_i[29],
    wbs_adr_i[28],
    wbs_adr_i[27],
    wbs_adr_i[26],
    wbs_adr_i[25],
    wbs_adr_i[24],
    wbs_adr_i[23],
    wbs_adr_i[22],
    wbs_adr_i[21],
    wbs_adr_i[20],
    wbs_adr_i[19],
    wbs_adr_i[18],
    wbs_adr_i[17],
    wbs_adr_i[16],
    wbs_adr_i[15],
    wbs_adr_i[14],
    wbs_adr_i[13],
    wbs_adr_i[12],
    wbs_adr_i[11],
    wbs_adr_i[10],
    wbs_adr_i[9],
    wbs_adr_i[8],
    wbs_adr_i[7],
    wbs_adr_i[6],
    wbs_adr_i[5],
    wbs_adr_i[4],
    wbs_adr_i[3],
    wbs_adr_i[2],
    wbs_adr_i[1],
    wbs_adr_i[0]}),
    .wbs_dat_i({wbs_dat_i[31],
    wbs_dat_i[30],
    wbs_dat_i[29],
    wbs_dat_i[28],
    wbs_dat_i[27],
    wbs_dat_i[26],
    wbs_dat_i[25],
    wbs_dat_i[24],
    wbs_dat_i[23],
    wbs_dat_i[22],
    wbs_dat_i[21],
    wbs_dat_i[20],
    wbs_dat_i[19],
    wbs_dat_i[18],
    wbs_dat_i[17],
    wbs_dat_i[16],
    wbs_dat_i[15],
    wbs_dat_i[14],
    wbs_dat_i[13],
    wbs_dat_i[12],
    wbs_dat_i[11],
    wbs_dat_i[10],
    wbs_dat_i[9],
    wbs_dat_i[8],
    wbs_dat_i[7],
    wbs_dat_i[6],
    wbs_dat_i[5],
    wbs_dat_i[4],
    wbs_dat_i[3],
    wbs_dat_i[2],
    wbs_dat_i[1],
    wbs_dat_i[0]}),
    .wbs_sel_i({wbs_sel_i[3],
    wbs_sel_i[2],
    wbs_sel_i[1],
    wbs_sel_i[0]}),
    .wmask0({\wmask0[3] ,
    \wmask0[2] ,
    \wmask0[1] ,
    \wmask0[0] }));
endmodule
