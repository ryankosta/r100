module r100_tb;

reg clock;
reg waddr;
reg [31:0] instrn;


initial begin
		$display("time\t       cpu");
		clock = 1;
		waddr = 0;
		
//        	instrn = (32'b0010011); //alui instruction
//        	instrn = instrn | (32'd3 << 7); //rd = x3
//        	instrn = instrn | (32'b110 << 12); // add
//        	instrn = instrn | (32'h0 << 15); //rs = x3
//        	instrn = instrn | (32'd12 << 20); //imm = 12
		$readmemh("/home/rkosta/dev/verilog/riscv-unpipe/asm/curr.8b.hex",cpu.instrnmem.ram);
		$monitor("instrn created %b",instrn);
		#9 cpu.pc_rst = 1;
		#14 cpu.pc_rst = 0;


//		cpu.instrnmem.ram[waddr] <= instrn[7:0];
//		cpu.instrnmem.ram[waddr+1] <= instrn[15:8];
//		cpu.instrnmem.ram[waddr+2] <= instrn[23:16];
//		cpu.instrnmem.ram[waddr+3] <= instrn[31:24];




		#1280 begin 
		$monitor("%g\tmem: %d reg3: %d reg4: %d x0: %d",$time,cpu.datamem.ram[5'h0],cpu.gpr.Register[5'h3],cpu.gpr.Register[5'h4],cpu.gpr.Register[5'h0]);
		$finish;
		end

end
//clock gen
always begin
	#10 begin
	       	clock = ~clock; //toggle clock every 5 ticks
		if(clock)
//			$monitor("+ %g\t%h %h %h %h",$time,cpu.pc_addrout,cpu.pcp4,cpu.pcsel,cpu.instrn,cpu.pc_addrin);
//			$monitor("+ %g\t%h %h %h %h %h %h %h %h %h",$time,cpu.pc_addrout,cpu.instrn,cpu.pcp4,cpu.pc_addrin,cpu.pc_brtarg,cpu.pcsel, cpu.branchif, cpu.comp_eq, cpu.brtarggenerator.btypeshrt);
			$monitor("+ %g\t%h %h %h %h %b %h %h",$time,cpu.instrn,cpu.op1,cpu.op2,cpu.alu_res,cpu.instrn[14:12],cpu.alu_cont,cpu.instrn[19:15]);
//			$monitor("+ %g\t%h %h %h %h %h %h %h %h",$time,cpu.pc_addrout, cpu.instrn,cpu.pcp4,cpu.pc_addrin,cpu.pc_jumptarg,cpu.pcsel, cpu.jumptarggenerator.addtoimm,cpu.jumptarggenerator.immediate);
//			$monitor("+ %g\t%b %b %d %d %d",$time,cpu.op1,cpu.op2,cpu.alu_res,cpu.regwr,cpu.gpr.Register[5'h3]);
//			$monitor("+ %g\t%h %h %h %h %b",$time,cpu.instrn,cpu.alu_res,cpu.reg_win,cpu.dmem_out,cpu.wbsel);
//			$monitor("+ %g\t%h %h %h%h%h%h",$time,cpu.datamem.raddr,cpu.datamem.out,cpu.datamem.ram[5'h3],cpu.datamem.ram[5'h2],cpu.datamem.ram[5'h1],cpu.datamem.ram[5'h0]);
			
		else
//			$monitor("- %g\t%h %h %h %h",$time,cpu.pc_addrout,cpu.pcp4,cpu.pcsel,cpu.instrn,cpu.pc_addrin);
//			$monitor("- %g\t%h %h %h %h %h %h %h %h",$time,cpu.pc_addrout,cpu.instrn,cpu.pcp4,cpu.pc_addrin,cpu.pc_jumptarg,cpu.pcsel, cpu.jumptarggenerator.addtoimm,cpu.jumptarggenerator.immediate);
			$monitor("- %g\t%h %h %h %h %b %h %h",$time,cpu.instrn,cpu.op1,cpu.op2,cpu.alu_res,cpu.instrn[14:12],cpu.alu_cont,cpu.instrn[19:15]);
//			$monitor("- %g\t%h %h %h %h %h %h %h %h %h",$time,cpu.pc_addrout,cpu.instrn,cpu.pcp4,cpu.pc_addrin,cpu.pc_brtarg,cpu.pcsel, cpu.branchif, cpu.comp_eq, cpu.brtarggenerator.btypeshrt);

//			$monitor("- %g\t%b %b ",$time,cpu.pc_addrout,cpu.pcp4,cpu.pcsel,cpu.instrn,cpu.pc_addrin);
//			$monitor("- %g\t%h %h %h %h %b",$time,cpu.instrn,cpu.alu_res,cpu.reg_win,cpu.dmem_out,cpu.memwr);
//			$monitor("- %g\t%h %h %h%h%h%h",$time,cpu.datamem.raddr,cpu.datamem.out,cpu.datamem.ram[5'h3],cpu.datamem.ram[5'h2],cpu.datamem.ram[5'h1],cpu.datamem.ram[5'h0]);

	end
end

always @(posedge clock) begin
	if(cpu.instrn[6:0] == 0010011 || cpu.instrn[6:0] == 0110011) begin
		case(cpu.instrn[14:12])
			3'b000:
				begin
				if(cpu.instrn[30] && cpu.instrn[5])	
					$monitor("%g\t%d -  %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				else
					$monitor("%g\t%d +  %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				end
			3'b001:
				begin
				$monitor("%g\t%d <<  %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				end
			3'b010:
				begin
				$monitor("%g\t%d <  %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				end
			3'b011:
				begin
				$monitor("%g\t%d <(u)  %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				end
			3'b100:
				begin
				$monitor("%g\t%d ^ %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				end
			3'b101:
				begin
				if(cpu.instrn[30] && cpu.instrn[5])	
					$monitor("%g\t%d >>(a) %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				else
					$monitor("%g\t%d >>(l) %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				end
			3'b110:
				begin
				$monitor("%g\t%d | %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				end
			3'b111:
				begin
				$monitor("%g\t%d & %d =  %d",$time,cpu.op1,cpu.op2,cpu.alu_res);
				end
		endcase
	end

end


r100 cpu(clock);
endmodule
