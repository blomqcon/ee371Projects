del vvp\*.* /s /q
del iverilog\*.* /s /q

C:\iverilog\bin\iverilog -o iverilog/SerialOutput_Test2 SerialOutput_Test2.v
C:\iverilog\bin\vvp iverilog/SerialOutput_Test2
<<<<<<< HEAD
C:\iverilog\gtkwave\bin\gtkwave vvp/serialoutput2.vcd
=======
C:\iverilog\gtkwave\bin\gtkwave vvp/serialoutput2.vcd
>>>>>>> f6773cc3ced225fd535626b263df39f9344668ec
