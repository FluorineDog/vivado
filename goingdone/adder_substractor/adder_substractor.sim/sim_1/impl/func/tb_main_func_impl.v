// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Mon Jun  5 08:38:26 2017
// Host        : mikedog running 64-bit Arch Linux
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/mike/workspace/vivado/adder_substractor/adder_substractor.sim/sim_1/impl/func/tb_main_func_impl.v
// Design      : main
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module counter
   (Q_OBUF,
    Qcc_reg,
    clk_IBUF_BUFG,
    LD_IBUF);
  output [3:0]Q_OBUF;
  output Qcc_reg;
  input clk_IBUF_BUFG;
  input LD_IBUF;

  wire LD_IBUF;
  wire \Q[0]_i_1_n_0 ;
  wire \Q[1]_C_i_1_n_0 ;
  wire \Q[2]_i_1_n_0 ;
  wire \Q[3]_i_1_n_0 ;
  wire \Q[3]_i_2_n_0 ;
  wire [3:0]Q_OBUF;
  wire \Q_reg[1]_C_n_0 ;
  wire \Q_reg[1]_LDC_i_1_n_0 ;
  wire \Q_reg[1]_LDC_n_0 ;
  wire \Q_reg[1]_P_n_0 ;
  wire Qcc_reg;
  wire clk_IBUF_BUFG;

  LUT1 #(
    .INIT(2'h1)) 
    \Q[0]_i_1 
       (.I0(Q_OBUF[0]),
        .O(\Q[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    \Q[1]_C_i_1 
       (.I0(Q_OBUF[0]),
        .I1(\Q_reg[1]_C_n_0 ),
        .I2(\Q_reg[1]_LDC_n_0 ),
        .I3(\Q_reg[1]_P_n_0 ),
        .O(\Q[1]_C_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h757F8A80)) 
    \Q[2]_i_1 
       (.I0(Q_OBUF[0]),
        .I1(\Q_reg[1]_P_n_0 ),
        .I2(\Q_reg[1]_LDC_n_0 ),
        .I3(\Q_reg[1]_C_n_0 ),
        .I4(Q_OBUF[2]),
        .O(\Q[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1DFFFFFFE2000000)) 
    \Q[3]_i_1 
       (.I0(\Q_reg[1]_C_n_0 ),
        .I1(\Q_reg[1]_LDC_n_0 ),
        .I2(\Q_reg[1]_P_n_0 ),
        .I3(Q_OBUF[0]),
        .I4(Q_OBUF[2]),
        .I5(Q_OBUF[3]),
        .O(\Q[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \Q[3]_i_2 
       (.I0(Q_OBUF[3]),
        .I1(LD_IBUF),
        .O(\Q[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \Q_OBUF[1]_inst_i_1 
       (.I0(\Q_reg[1]_P_n_0 ),
        .I1(\Q_reg[1]_LDC_n_0 ),
        .I2(\Q_reg[1]_C_n_0 ),
        .O(Q_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\Q[3]_i_2_n_0 ),
        .D(\Q[0]_i_1_n_0 ),
        .Q(Q_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[1]_C 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(Q_OBUF[3]),
        .D(\Q[1]_C_i_1_n_0 ),
        .Q(\Q_reg[1]_C_n_0 ));
  (* XILINX_LEGACY_PRIM = "LDC" *) 
  LDCE #(
    .INIT(1'b0)) 
    \Q_reg[1]_LDC 
       (.CLR(Q_OBUF[3]),
        .D(1'b1),
        .G(\Q_reg[1]_LDC_i_1_n_0 ),
        .GE(1'b1),
        .Q(\Q_reg[1]_LDC_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \Q_reg[1]_LDC_i_1 
       (.I0(Q_OBUF[3]),
        .I1(LD_IBUF),
        .O(\Q_reg[1]_LDC_i_1_n_0 ));
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
    \Q_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\Q[3]_i_2_n_0 ),
        .D(\Q[2]_i_1_n_0 ),
        .Q(Q_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(\Q[3]_i_2_n_0 ),
        .D(\Q[3]_i_1_n_0 ),
        .Q(Q_OBUF[3]));
  LUT6 #(
    .INIT(64'hFFFF757FFFFFFFFF)) 
    Qcc_i_1
       (.I0(Q_OBUF[0]),
        .I1(\Q_reg[1]_P_n_0 ),
        .I2(\Q_reg[1]_LDC_n_0 ),
        .I3(\Q_reg[1]_C_n_0 ),
        .I4(Q_OBUF[3]),
        .I5(Q_OBUF[2]),
        .O(Qcc_reg));
endmodule

(* ECO_CHECKSUM = "3725928a" *) 
(* NotValidForBitStream *)
module main
   (clk,
    LD,
    Q,
    Qcc);
  input clk;
  input LD;
  output [3:0]Q;
  output Qcc;

  wire LD;
  wire LD_IBUF;
  wire [3:0]Q;
  wire [3:0]Q_OBUF;
  wire Qcc;
  wire Qcc_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire counter0_n_4;

  IBUF LD_IBUF_inst
       (.I(LD),
        .O(LD_IBUF));
  OBUF \Q_OBUF[0]_inst 
       (.I(Q_OBUF[0]),
        .O(Q[0]));
  OBUF \Q_OBUF[1]_inst 
       (.I(Q_OBUF[1]),
        .O(Q[1]));
  OBUF \Q_OBUF[2]_inst 
       (.I(Q_OBUF[2]),
        .O(Q[2]));
  OBUF \Q_OBUF[3]_inst 
       (.I(Q_OBUF[3]),
        .O(Q[3]));
  OBUF Qcc_OBUF_inst
       (.I(Qcc_OBUF),
        .O(Qcc));
  FDRE #(
    .INIT(1'b0)) 
    Qcc_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_n_4),
        .Q(Qcc_OBUF),
        .R(1'b0));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  counter counter0
       (.LD_IBUF(LD_IBUF),
        .Q_OBUF(Q_OBUF),
        .Qcc_reg(counter0_n_4),
        .clk_IBUF_BUFG(clk_IBUF_BUFG));
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
