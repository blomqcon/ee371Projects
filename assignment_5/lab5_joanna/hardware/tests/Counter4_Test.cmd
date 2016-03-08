del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/Counter4_Test Counter4_Test.v
C:\iverilog\bin\vvp iverilog/Counter4_Test
C:\iverilog\gtkwave\bin\gtkwave vvp/counter4.vcd