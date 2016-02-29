del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/SerialOutput_Test SerialOutput_Test.v
C:\iverilog\bin\vvp iverilog/SerialOutput_Test
C:\iverilog\gtkwave\bin\gtkwave vvp/serialoutput.vcd