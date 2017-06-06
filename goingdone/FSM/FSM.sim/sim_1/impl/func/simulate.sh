#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2017.1"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim tb_fsm_func_impl -key {Post-Implementation:sim_1:Functional:tb_fsm} -tclbatch tb_fsm.tcl -log simulate.log
