del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/BitSampleCount_Test BitSampleCount_Test.v
C:\iverilog\bin\vvp iverilog/BitSampleCount_Test
C:\iverilog\gtkwave\bin\gtkwave vvp/bitsamplecount.vcd