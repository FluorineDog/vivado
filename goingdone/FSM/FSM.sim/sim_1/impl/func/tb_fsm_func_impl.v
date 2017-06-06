// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
// Date        : Mon Jun  5 09:20:19 2017
// Host        : mikedog running 64-bit Arch Linux
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/mike/workspace/vivado/FSM/FSM.sim/sim_1/impl/func/tb_fsm_func_impl.v
// Design      : fsm
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "bee544c6" *) (* STATE_1 = "3'b001" *) (* STATE_2 = "3'b010" *) 
(* STATE_3 = "3'b011" *) (* STATE_4 = "3'b101" *) (* STATE_5 = "3'b100" *) 
(* STATE_6_PlaceHolder = "3'b110" *) (* STATE_7_PlaceHolder = "3'b111" *) (* STATE_Initial = "3'b000" *) 
(* NotValidForBitStream *)
module fsm
   (Clock,
    Reset,
    x,
    Output1,
    Status);
  input Clock;
  input Reset;
  input x;
  output Output1;
  output [2:0]Status;

  wire Clock;
  wire Clock_IBUF;
  wire Clock_IBUF_BUFG;
  (* RTL_KEEP = "yes" *) wire [2:0]CurrentState;
  wire \FSM_sequential_CurrentState[0]_i_1_n_0 ;
  wire \FSM_sequential_CurrentState[1]_i_1_n_0 ;
  wire \FSM_sequential_CurrentState[2]_i_1_n_0 ;
  wire Output1;
  wire Output1_OBUF;
  wire Reset;
  wire Reset_IBUF;
  wire [2:0]Status;
  wire [2:0]Status_OBUF;
  wire x;
  wire x_IBUF;

  BUFG Clock_IBUF_BUFG_inst
       (.I(Clock_IBUF),
        .O(Clock_IBUF_BUFG));
  IBUF Clock_IBUF_inst
       (.I(Clock),
        .O(Clock_IBUF));
  LUT5 #(
    .INIT(32'h000004DC)) 
    \FSM_sequential_CurrentState[0]_i_1 
       (.I0(CurrentState[0]),
        .I1(x_IBUF),
        .I2(CurrentState[2]),
        .I3(CurrentState[1]),
        .I4(Reset_IBUF),
        .O(\FSM_sequential_CurrentState[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00001424)) 
    \FSM_sequential_CurrentState[1]_i_1 
       (.I0(CurrentState[2]),
        .I1(CurrentState[0]),
        .I2(x_IBUF),
        .I3(CurrentState[1]),
        .I4(Reset_IBUF),
        .O(\FSM_sequential_CurrentState[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000180)) 
    \FSM_sequential_CurrentState[2]_i_1 
       (.I0(x_IBUF),
        .I1(CurrentState[0]),
        .I2(CurrentState[1]),
        .I3(CurrentState[2]),
        .I4(Reset_IBUF),
        .O(\FSM_sequential_CurrentState[2]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_CurrentState_reg[0] 
       (.C(Clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_CurrentState[0]_i_1_n_0 ),
        .Q(CurrentState[0]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_CurrentState_reg[1] 
       (.C(Clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_CurrentState[1]_i_1_n_0 ),
        .Q(CurrentState[1]),
        .R(1'b0));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_CurrentState_reg[2] 
       (.C(Clock_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_CurrentState[2]_i_1_n_0 ),
        .Q(CurrentState[2]),
        .R(1'b0));
  OBUF Output1_OBUF_inst
       (.I(Output1_OBUF),
        .O(Output1));
  LUT3 #(
    .INIT(8'h40)) 
    Output1_OBUF_inst_i_1
       (.I0(CurrentState[1]),
        .I1(CurrentState[0]),
        .I2(CurrentState[2]),
        .O(Output1_OBUF));
  IBUF Reset_IBUF_inst
       (.I(Reset),
        .O(Reset_IBUF));
  OBUF \Status_OBUF[0]_inst 
       (.I(Status_OBUF[0]),
        .O(Status[0]));
  LUT3 #(
    .INIT(8'h26)) 
    \Status_OBUF[0]_inst_i_1 
       (.I0(CurrentState[0]),
        .I1(CurrentState[2]),
        .I2(CurrentState[1]),
        .O(Status_OBUF[0]));
  OBUF \Status_OBUF[1]_inst 
       (.I(Status_OBUF[1]),
        .O(Status[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \Status_OBUF[1]_inst_i_1 
       (.I0(CurrentState[1]),
        .I1(CurrentState[2]),
        .O(Status_OBUF[1]));
  OBUF \Status_OBUF[2]_inst 
       (.I(Status_OBUF[2]),
        .O(Status[2]));
  LUT2 #(
    .INIT(4'h2)) 
    \Status_OBUF[2]_inst_i_1 
       (.I0(CurrentState[2]),
        .I1(CurrentState[1]),
        .O(Status_OBUF[2]));
  IBUF x_IBUF_inst
       (.I(x),
        .O(x_IBUF));
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
