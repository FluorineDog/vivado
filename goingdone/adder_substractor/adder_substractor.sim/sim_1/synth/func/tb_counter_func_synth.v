// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Wed May 31 18:48:04 2017
// Host        : mikedog running 64-bit Arch Linux
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/mike/workspace/vivado/adder_substractor/adder_substractor.sim/sim_1/synth/func/tb_counter_func_synth.v
// Design      : counter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module counter
   (clk,
    clear,
    M,
    base,
    LD,
    Q,
    Qcc);
  input clk;
  input clear;
  input M;
  input [3:0]base;
  input LD;
  output [3:0]Q;
  output Qcc;

  wire LD;
  wire LD_IBUF;
  wire M;
  wire M_IBUF;
  wire [3:0]Q;
  wire \Q[0]_C_i_1_n_0 ;
  wire \Q[1]_C_i_1_n_0 ;
  wire \Q[2]_C_i_1_n_0 ;
  wire \Q[3]_C_i_1_n_0 ;
  wire [3:0]Q_OBUF;
  wire \Q_reg[0]_C_n_0 ;
  wire \Q_reg[0]_LDC_i_1_n_0 ;
  wire \Q_reg[0]_LDC_i_2_n_0 ;
  wire \Q_reg[0]_LDC_n_0 ;
  wire \Q_reg[0]_P_n_0 ;
  wire \Q_reg[1]_C_n_0 ;
  wire \Q_reg[1]_LDC_i_1_n_0 ;
  wire \Q_reg[1]_LDC_i_2_n_0 ;
  wire \Q_reg[1]_LDC_n_0 ;
  wire \Q_reg[1]_P_n_0 ;
  wire \Q_reg[2]_C_n_0 ;
  wire \Q_reg[2]_LDC_i_1_n_0 ;
  wire \Q_reg[2]_LDC_i_2_n_0 ;
  wire \Q_reg[2]_LDC_n_0 ;
  wire \Q_reg[2]_P_n_0 ;
  wire \Q_reg[3]_C_n_0 ;
  wire \Q_reg[3]_LDC_i_1_n_0 ;
  wire \Q_reg[3]_LDC_i_2_n_0 ;
  wire \Q_reg[3]_LDC_n_0 ;
  wire \Q_reg[3]_P_n_0 ;
  wire Qcc;
  wire Qcc_OBUF;
  wire Qcc_i_1_n_0;
  wire [3:0]base;
  wire [3:0]base_IBUF;
  wire clear;
  wire clear_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;

  IBUF LD_IBUF_inst
       (.I(LD),
        .O(LD_IBUF));
  IBUF M_IBUF_inst
       (.I(M),
        .O(M_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h1D)) 
    \Q[0]_C_i_1 
       (.I0(\Q_reg[0]_C_n_0 ),
        .I1(\Q_reg[0]_LDC_n_0 ),
        .I2(\Q_reg[0]_P_n_0 ),
        .O(\Q[0]_C_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hE21D1DE2)) 
    \Q[1]_C_i_1 
       (.I0(\Q_reg[0]_C_n_0 ),
        .I1(\Q_reg[0]_LDC_n_0 ),
        .I2(\Q_reg[0]_P_n_0 ),
        .I3(M_IBUF),
        .I4(Q_OBUF[1]),
        .O(\Q[1]_C_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF4700B8B8FF4700)) 
    \Q[2]_C_i_1 
       (.I0(\Q_reg[0]_P_n_0 ),
        .I1(\Q_reg[0]_LDC_n_0 ),
        .I2(\Q_reg[0]_C_n_0 ),
        .I3(M_IBUF),
        .I4(Q_OBUF[2]),
        .I5(Q_OBUF[1]),
        .O(\Q[2]_C_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBF40FD02)) 
    \Q[3]_C_i_1 
       (.I0(M_IBUF),
        .I1(Q_OBUF[0]),
        .I2(Q_OBUF[1]),
        .I3(Q_OBUF[3]),
        .I4(Q_OBUF[2]),
        .O(\Q[3]_C_i_1_n_0 ));
  OBUF \Q_OBUF[0]_inst 
       (.I(Q_OBUF[0]),
        .O(Q[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \Q_OBUF[0]_inst_i_1 
       (.I0(\Q_reg[0]_P_n_0 ),
        .I1(\Q_reg[0]_LDC_n_0 ),
        .I2(\Q_reg[0]_C_n_0 ),
        .O(Q_OBUF[0]));
  OBUF \Q_OBUF[1]_inst 
       (.I(Q_OBUF[1]),
        .O(Q[1]));
  LUT3 #(
    .INIT(8'hB8)) 
    \Q_OBUF[1]_inst_i_1 
       (.I0(\Q_reg[1]_P_n_0 ),
        .I1(\Q_reg[1]_LDC_n_0 ),
        .I2(\Q_reg[1]_C_n_0 ),
        .O(Q_OBUF[1]));
  OBUF \Q_OBUF[2]_inst 
       (.I(Q_OBUF[2]),
        .O(Q[2]));
  LUT3 #(
    .INIT(8'hB8)) 
    \Q_OBUF[2]_inst_i_1 
       (.I0(\Q_reg[2]_P_n_0 ),
        .I1(\Q_reg[2]_LDC_n_0 ),
        .I2(\Q_reg[2]_C_n_0 ),
        .O(Q_OBUF[2]));
  OBUF \Q_OBUF[3]_inst 
       (.I(Q_OBUF[3]),
        .O(Q[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \Q_OBUF[3]_inst_i_1 
       (.I0(\Q_reg[3]_P_n_0 ),
        .I1(\Q_reg[3]_LDC_n_0 ),
        .I2(\Q_reg[3]_C_n_0 ),
        .O(Q_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0]_C 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\Q_reg[0]_LDC_i_2_n_0 ),
        .D(\Q[0]_C_i_1_n_0 ),
        .Q(\Q_reg[0]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \Q_reg[0]_LDC 
       (.CLR(\Q_reg[0]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\Q_reg[0]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\Q_reg[0]_LDC_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \Q_reg[0]_LDC_i_1 
       (.I0(clear_IBUF),
        .I1(base_IBUF[0]),
        .I2(LD_IBUF),
        .O(\Q_reg[0]_LDC_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h57)) 
    \Q_reg[0]_LDC_i_2 
       (.I0(clear_IBUF),
        .I1(base_IBUF[0]),
        .I2(LD_IBUF),
        .O(\Q_reg[0]_LDC_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \Q_reg[0]_P 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q[0]_C_i_1_n_0 ),
        .PRE(\Q_reg[0]_LDC_i_1_n_0 ),
        .Q(\Q_reg[0]_P_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1]_C 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\Q_reg[1]_LDC_i_2_n_0 ),
        .D(\Q[1]_C_i_1_n_0 ),
        .Q(\Q_reg[1]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \Q_reg[1]_LDC 
       (.CLR(\Q_reg[1]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\Q_reg[1]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\Q_reg[1]_LDC_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \Q_reg[1]_LDC_i_1 
       (.I0(clear_IBUF),
        .I1(base_IBUF[1]),
        .I2(LD_IBUF),
        .O(\Q_reg[1]_LDC_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h57)) 
    \Q_reg[1]_LDC_i_2 
       (.I0(clear_IBUF),
        .I1(base_IBUF[1]),
        .I2(LD_IBUF),
        .O(\Q_reg[1]_LDC_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \Q_reg[1]_P 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q[1]_C_i_1_n_0 ),
        .PRE(\Q_reg[1]_LDC_i_1_n_0 ),
        .Q(\Q_reg[1]_P_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[2]_C 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\Q_reg[2]_LDC_i_2_n_0 ),
        .D(\Q[2]_C_i_1_n_0 ),
        .Q(\Q_reg[2]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \Q_reg[2]_LDC 
       (.CLR(\Q_reg[2]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\Q_reg[2]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\Q_reg[2]_LDC_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \Q_reg[2]_LDC_i_1 
       (.I0(clear_IBUF),
        .I1(base_IBUF[2]),
        .I2(LD_IBUF),
        .O(\Q_reg[2]_LDC_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h57)) 
    \Q_reg[2]_LDC_i_2 
       (.I0(clear_IBUF),
        .I1(base_IBUF[2]),
        .I2(LD_IBUF),
        .O(\Q_reg[2]_LDC_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \Q_reg[2]_P 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q[2]_C_i_1_n_0 ),
        .PRE(\Q_reg[2]_LDC_i_1_n_0 ),
        .Q(\Q_reg[2]_P_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3]_C 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\Q_reg[3]_LDC_i_2_n_0 ),
        .D(\Q[3]_C_i_1_n_0 ),
        .Q(\Q_reg[3]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \Q_reg[3]_LDC 
       (.CLR(\Q_reg[3]_LDC_i_2_n_0 ),
        .D(1'b1),
        .G(\Q_reg[3]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\Q_reg[3]_LDC_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \Q_reg[3]_LDC_i_1 
       (.I0(clear_IBUF),
        .I1(base_IBUF[3]),
        .I2(LD_IBUF),
        .O(\Q_reg[3]_LDC_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h57)) 
    \Q_reg[3]_LDC_i_2 
       (.I0(clear_IBUF),
        .I1(base_IBUF[3]),
        .I2(LD_IBUF),
        .O(\Q_reg[3]_LDC_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \Q_reg[3]_P 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\Q[3]_C_i_1_n_0 ),
        .PRE(\Q_reg[3]_LDC_i_1_n_0 ),
        .Q(\Q_reg[3]_P_n_0 ));
  OBUF Qcc_OBUF_inst
       (.I(Qcc_OBUF),
        .O(Qcc));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBFFFFFFD)) 
    Qcc_i_1
       (.I0(M_IBUF),
        .I1(Q_OBUF[3]),
        .I2(Q_OBUF[2]),
        .I3(Q_OBUF[0]),
        .I4(Q_OBUF[1]),
        .O(Qcc_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    Qcc_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(Qcc_i_1_n_0),
        .Q(Qcc_OBUF),
        .R(1'b0));
  IBUF \base_IBUF[0]_inst 
       (.I(base[0]),
        .O(base_IBUF[0]));
  IBUF \base_IBUF[1]_inst 
       (.I(base[1]),
        .O(base_IBUF[1]));
  IBUF \base_IBUF[2]_inst 
       (.I(base[2]),
        .O(base_IBUF[2]));
  IBUF \base_IBUF[3]_inst 
       (.I(base[3]),
        .O(base_IBUF[3]));
  IBUF clear_IBUF_inst
       (.I(clear),
        .O(clear_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
