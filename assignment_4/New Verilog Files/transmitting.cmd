del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/transmitting_testbench transmitting_testbench.v
C:\iverilog\bin\vvp iverilog/transmitting_testbench
C:\iverilog\gtkwave\bin\gtkwave vvp/transmitting.vcd