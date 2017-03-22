module testbench;

wire [3:0] out;
wire tdo_a, tdo_b;
reg [3:0] in;
reg tdi_a, tdi_b, rst;
reg shift_a, shift_b, update_a, update_b, clk_a, clk_b, ms_a, ms_b;

TOP  t( .OUT(out), .TDO_A(tdo_a), .TDO_B(tdo_b), 
        .IN(in), .TDI_A(tdi_a), .TDI_B(tdi_b), 
        .Mode_Control_A(ms_a), .ShiftDR_A(shift_a), .UpdateDR_A(update_a), .ClockDR_A(clk_a), 
        .Mode_Control_B(ms_b), .ShiftDR_B(shift_b), .UpdateDR_B(update_b), .ClockDR_B(clk_b), .RST(rst));

initial begin
$fsdbDumpfile("TOP.fsdb");
$fsdbDumpvars;
end

initial begin
  
    clk_a = 0; 
    clk_b = 0;
    in = 0;
    tdi_a = 0;
    tdi_b = 0;
    ms_a = 1;
    ms_b = 0;
    shift_a = 1;
    shift_b = 1;
    update_a = 0;
    update_b = 0;
   
end
always #5 update_a = ~update_a;
always #5 update_b = ~update_b;
always #5 clk_a = ~clk_a;
always #5 clk_b = ~clk_b;

initial begin
//initialize BSC
tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 0;
//iuput pattern 0000
#10 tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 0;
//input pattern 0001
#10 tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 1;
//input pattern 0010
#10 tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 1;
#10 tdi_a = 0;
//input pattern 0011
#10 tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 1;
#10 tdi_a = 1;
//input pattern 0100
#10 tdi_a = 0;
#10 tdi_a = 1;
#10 tdi_a = 0;
#10 tdi_a = 0;
//input pattern 0101
#10 tdi_a = 0;
#10 tdi_a = 1;
#10 tdi_a = 0;
#10 tdi_a = 1;
//input pattern 0110
#10 tdi_a = 0;
#10 tdi_a = 1;
#10 tdi_a = 1;
#10 tdi_a = 0;
//input pattern 0111
#10 tdi_a = 0;
#10 tdi_a = 1;
#10 tdi_a = 1;
#10 tdi_a = 1;
//input pattern 1000
#10 tdi_a = 1;
#10 tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 0;
//input pattern 1001
#10 tdi_a = 1;
#10 tdi_a = 0;
#10 tdi_a = 0;
#10 tdi_a = 1;
//input pattern 1010
#10 tdi_a = 1;
#10 tdi_a = 0;
#10 tdi_a = 1;
#10 tdi_a = 0;
//input pattern 1011
#10 tdi_a = 1;
#10 tdi_a = 0;
#10 tdi_a = 1;
#10 tdi_a = 1;
//input pattern 1100
#10 tdi_a = 1;
#10 tdi_a = 1;
#10 tdi_a = 0;
#10 tdi_a = 0;
//input pattern 1101
#10 tdi_a = 1;
#10 tdi_a = 1;
#10 tdi_a = 0;
#10 tdi_a = 1;
//input pattern 1110
#10 tdi_a = 1;
#10 tdi_a = 1;
#10 tdi_a = 1;
#10 tdi_a = 0;
//input pattern 1111
#10 tdi_a = 1;
#10 tdi_a = 1;
#10 tdi_a = 1;
#10 tdi_a = 1;
#40 
$finish;
end

endmodule