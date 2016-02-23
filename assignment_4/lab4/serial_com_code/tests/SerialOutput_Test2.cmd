del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/SerialOutput_Test2 SerialOutput_Test2.v
C:\iverilog\bin\vvp iverilog/SerialOutput_Test2
C:\iverilog\gtkwave\bin\gtkwave vvp/serialoutput2.vcd