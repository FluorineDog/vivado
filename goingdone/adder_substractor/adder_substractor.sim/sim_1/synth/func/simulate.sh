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
ExecStep $xv_path/bin/xsim tb_counter_func_synth -key {Post-Synthesis:sim_1:Functional:tb_counter} -tclbatch tb_counter.tcl -log simulate.log
