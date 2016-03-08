del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/StartBitDetect_Test StartBitDetect_Test.v
C:\iverilog\bin\vvp iverilog/StartBitDetect_Test
C:\iverilog\gtkwave\bin\gtkwave vvp/startbitdetect.vcd