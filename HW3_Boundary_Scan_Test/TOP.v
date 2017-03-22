module TOP (    output [3:0]OUT, 
                output TDO_A, TDO_B, 
                input [3:0]IN,
                input TDI_A, Mode_Control_A, ShiftDR_A, UpdateDR_A, ClockDR_A, 
                input TDI_B, Mode_Control_B, ShiftDR_B, UpdateDR_B, ClockDR_B,
                input RST
);
    wire [3:0] data;
    
    IC A(.TDO(TDO_A), .data_out(data), .TDI(TDI_A), .data_in(IN), .Mode_Control(Mode_Control_A), 
            .ShiftDR(ShiftDR_A), .UpdateDR(UpdateDR_A), .ClockDR(ClockDR_A), .RST(RST));
    IC B(.TDO(TDO_B), .data_out(OUT), .TDI(TDI_B), .data_in(data), .Mode_Control(Mode_Control_B),
            .ShiftDR(ShiftDR_B), .UpdateDR(UpdateDR_B), .ClockDR(ClockDR_B), .RST(RST));
endmodule

module IC (TDO, data_out, TDI, data_in, Mode_Control, ShiftDR, UpdateDR, ClockDR, RST);
    output [3:0] data_out;
    output TDO;
    input [3:0] data_in;
    input TDI, Mode_Control, ShiftDR, UpdateDR, ClockDR, RST;
    wire scan1, scan2, scan3, scan4, q1;
    
    BSC_Cell B1(.data_out(data_out[0]), .scan_out(scan1), .data_in(data_in[0]), .scan_in(TDI), 
                .mode(Mode_Control), .shiftDR(ShiftDR), 
				.updateDR(UpdateDR), .clockDR(ClockDR));
    BSC_Cell B2(.data_out(data_out[1]), .scan_out(scan2), .data_in(data_in[1]), .scan_in(scan1), 
                .mode(Mode_Control), .shiftDR(ShiftDR), 
				.updateDR(UpdateDR), .clockDR(ClockDR));
    BSC_Cell B3(.data_out(data_out[2]), .scan_out(scan3), .data_in(data_in[2]), .scan_in(scan2), 
                .mode(Mode_Control), .shiftDR(ShiftDR), 
				.updateDR(UpdateDR), .clockDR(ClockDR));
    BSC_Cell B4(.data_out(data_out[3]), .scan_out(scan4), .data_in(data_in[3]), .scan_in(scan3), 
                .mode(Mode_Control), .shiftDR(ShiftDR), 
				.updateDR(UpdateDR), .clockDR(ClockDR));
 

endmodule

module BSC_Cell  (data_out, scan_out, data_in, mode, scan_in, shiftDR, updateDR, clockDR);
output 	data_out;
output	scan_out;
input	data_in;
input	mode, scan_in, shiftDR, updateDR, clockDR;
reg		scan_out, update_reg;

always @ (posedge clockDR) begin
scan_out <= shiftDR ? scan_in : data_in;
end

always @ (posedge updateDR) update_reg <= scan_out;
assign data_out = mode ? update_reg : data_in;

endmodule
