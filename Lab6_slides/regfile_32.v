`include "mux32_1.v"
`include "decoder.v"
`include "mux4_1.v"
`include "register.v"


module RegFile_32(ReadData1, ReadData2, Clock, Reset, RegWrite, ReadReg1, ReadReg2, WriteRegNo, WriteData);
  input Clock, Reset, RegWrite;
  input [4:0] ReadReg1, ReadReg2, WriteRegNo;
  input [31:0]  WriteData;
  output  [31:0]  ReadData1, ReadData2;
  wire  [31:0]  Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, Data24, Data25, Data26, Data27, Data28, Data29, Data30, Data31;
  wire  [31:0] Decode;
  wire  [31:0]c;
  genvar  j;
  decoder5_32 dec(Decode, WriteRegNo);
  generate
    for(j = 0; j < 32; j = j + 1) begin:  and_loop
      and g(c[j], RegWrite, Decode[j], Clock);
    end
  endgenerate
  reg_32bit r0(Data0, WriteData, c[0], Reset);
  reg_32bit r1(Data1, WriteData, c[1], Reset);
  reg_32bit r2(Data2, WriteData, c[2], Reset);
  reg_32bit r3(Data3, WriteData, c[3], Reset);
  reg_32bit r4(Data4, WriteData, c[4], Reset);
  reg_32bit r5(Data5, WriteData, c[5], Reset);
  reg_32bit r6(Data6, WriteData, c[6], Reset);
  reg_32bit r7(Data7, WriteData, c[7], Reset);
  reg_32bit r8(Data8, WriteData, c[8], Reset);
  reg_32bit r9(Data9, WriteData, c[9], Reset);
  reg_32bit r10(Data10, WriteData, c[10], Reset);
  reg_32bit r11(Data11, WriteData, c[11], Reset);
  reg_32bit r12(Data12, WriteData, c[12], Reset);
  reg_32bit r13(Data13, WriteData, c[13], Reset);
  reg_32bit r14(Data14, WriteData, c[14], Reset);
  reg_32bit r15(Data15, WriteData, c[15], Reset);
  reg_32bit r16(Data16, WriteData, c[16], Reset);
  reg_32bit r17(Data17, WriteData, c[17], Reset);
  reg_32bit r18(Data18, WriteData, c[18], Reset);
  reg_32bit r19(Data19, WriteData, c[19], Reset);
  reg_32bit r20(Data20, WriteData, c[20], Reset);
  reg_32bit r21(Data21, WriteData, c[21], Reset);
  reg_32bit r22(Data22, WriteData, c[22], Reset);
  reg_32bit r23(Data23, WriteData, c[23], Reset);
  reg_32bit r24(Data24, WriteData, c[24], Reset);
  reg_32bit r25(Data25, WriteData, c[25], Reset);
  reg_32bit r26(Data26, WriteData, c[26], Reset);
  reg_32bit r27(Data27, WriteData, c[27], Reset);
  reg_32bit r28(Data28, WriteData, c[28], Reset);
  reg_32bit r29(Data29, WriteData, c[29], Reset);
  reg_32bit r30(Data30, WriteData, c[30], Reset);
  reg_32bit r31(Data31, WriteData, c[31], Reset);
  mux32_1 m0(ReadData1, Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, Data24, Data25, Data26, Data27, Data28, Data29, Data30, Data31, ReadReg1);
  mux32_1 m1(ReadData2, Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, Data24, Data25, Data26, Data27, Data28, Data29, Data30, Data31, ReadReg2);
endmodule

/*
module tbRegFile32;
  reg Clock, Reset, RegWrite;
  reg [4:0] ReadReg1, ReadReg2, WriteRegNo;
  reg [31:0]  WriteData;
  wire  [31:0]  ReadData1, ReadData2;
  RegFile_32 rgf(ReadData1, ReadData2, Clock, Reset, RegWrite, ReadReg1, ReadReg2, WriteRegNo, WriteData);
  initial begin
    $monitor($time, ": Reset = %b, RegWrite = %b, ReadReg1 = %b, ReadReg2 = %b, WriteRegNo = %b, WriteData = %b, ReadData1 = %b, ReadData2 = %b.", Reset, RegWrite, ReadReg1, ReadReg2, WriteRegNo, WriteData, ReadData1, ReadData2);
    #0   Clock = 1'b1; ReadReg1 = 5'b00000; ReadReg2 = 5'b11111; Reset = 1'b1;
    #2   Reset = 1'b0;
    #10   Reset = 1'b1; RegWrite = 1'b1;  WriteData = 32'h00000001; WriteRegNo = 5'b00000;
    repeat(31)   begin
        #10   WriteData = WriteData + 32'h00000001;   WriteRegNo = WriteRegNo + 5'b00001;
    end
    #10   RegWrite = 1'b0;   ReadReg1 = 5'b00000;   ReadReg2 = 5'b00001;
    repeat(15)   begin
        #10   ReadReg1 = ReadReg1 + 5'b00010;   ReadReg2 = ReadReg2 + 5'b00010;
    end
    #10   $finish;
  end
  always
    #5  Clock = ~Clock;
endmodule
*/