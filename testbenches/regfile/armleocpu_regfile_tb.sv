`timescale 1ns/1ns
module regfile_testbench;

reg clk = 0;
reg async_rst_n = 1;

initial begin
	#1 async_rst_n = 0;
	#1 async_rst_n = 1;
	
end
always begin
	#5 clk <= !clk;
end

`define assert(signal, value) \
        if (signal !== value) begin \
            $display("ASSERTION FAILED in %m: signal != value"); \
            $finish; \
        end


reg	[4:0]	rs1_addr = 0;
wire	[31:0]	rs1_rdata;

reg	[4:0]	rs2_addr = 0;
wire	[31:0]	rs2_rdata;


reg	[4:0]	rd_addr = 0;
reg	[31:0]	rd_wdata = 32'hFF00FF00;
reg			rd_write = 0;


initial begin
	$dumpfile(`SIMRESULT);
	$dumpvars;
	#100
	$finish;
end

armleocpu_regfile regfile (
	.*
);


integer state = 0;

always @* begin
	case(state)
		0: begin
			rd_write = 1;
			rd_addr = 0;
			
			
		end
		1: begin
			rd_write = 1;
			rd_addr = 1;
			
			rs1_addr = 0;
			rs2_addr = 1;
			`assert(rs1_rdata, 0);
			`assert(rs2_rdata, 0);
		end
		2: begin
			rs1_addr = 1;
			rs2_addr = 1;
			`assert(rs1_rdata, 32'hFF00FF00);
			`assert(rs2_rdata, 32'hFF00FF00);
		end
		default: begin
			rd_write = 0;
			rd_addr = 0;
			rs1_addr = 0;
			rs2_addr = 0;
		end
	endcase
end

always @(posedge clk) begin
	state <= state + 1;
end


endmodule