del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/SerialInput_Test SerialInput_Test.v
C:\iverilog\bin\vvp iverilog/SerialInput_Test
C:\iverilog\gtkwave\bin\gtkwave vvp/serialinput.vcd