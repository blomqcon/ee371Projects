del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/receiving_testbench receiving_testbench.v
C:\iverilog\bin\vvp iverilog/receiving_testbench
C:\iverilog\gtkwave\bin\gtkwave vvp/receiving.vcd