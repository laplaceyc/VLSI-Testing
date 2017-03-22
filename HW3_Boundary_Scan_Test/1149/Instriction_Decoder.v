module Instruction_Decoder (mode, select_BR, shift_BR, clock_BR, shift_BSC_Reg, clock_BSC_Reg, update_BSC_Reg, instruction, shiftIR, clockIR, updateIR);
  parameter 	IR_size 			= 2;
  output					mode, select_BR, shift_BR, clock_BR;
  output					shift_BSC_Reg, clock_BSC_Reg, update_BSC_Reg;
  input					shiftIR, clockIR, updateIR;
  input		[IR_size -1: 0]		instruction;
  parameter	BYPASS		= 2'b00;	
  parameter	EXTEST			= 2'b01;
  parameter	INTEST			= 2'b01;
  parameter	SAMPLE_PRELOAD	= 2'b11;
  reg		mode, select_BR, clock_BR, clock_BSC_Reg, update_BSC_Reg;
 
  assign 	shift_BR = shiftIR;
  assign		shift_BSC_Reg = shiftIR;

  always @ (instruction or clockIR or updateIR) begin
    mode = 0; select_BR = 0;		// default is test-data register
    clock_BR = 1; clock_BSC_Reg = 1;
    update_BSC_Reg = 0;

    case (instruction)
	  BYPASS:		begin select_BR = 1; clock_BR = clockIR; end	 	// 1 selects bypass reg
      EXTEST:		begin mode = 1; clock_BSC_Reg = clockIR; update_BSC_Reg = updateIR; end	
      INTEST:		begin mode = 1; clock_BSC_Reg = clockIR; update_BSC_Reg = updateIR; end	
      SAMPLE_PRELOAD:	begin  clock_BSC_Reg = clockIR; update_BSC_Reg = updateIR; end
      default:		begin select_BR = 1; end	 				// 1 selects bypass reg

    endcase	
  end	
endmodule
