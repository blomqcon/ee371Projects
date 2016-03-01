del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/BitIdentifierCount_Test BitIdentifierCount_Test.v
C:\iverilog\bin\vvp iverilog/BitIdentifierCount_Test
C:\iverilog\gtkwave\bin\gtkwave vvp/bitidentifiercount.vcd