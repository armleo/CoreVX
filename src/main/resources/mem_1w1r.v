
module mem_1w1r(
    input clock,
    input reset,

    input [ELEMENTS_W-1:0] readaddress,
    input read,
    output [WIDTH-1:0] readdata,

	input [ELEMENTS_W-1:0] writeaddress,
	input write,
	input [WIDTH-1:0] writedata
);

parameter ELEMENTS_W = 7;
localparam ELEMENTS = 2**ELEMENTS_W;
parameter WIDTH = 32;

reg [WIDTH-1:0] storage[ELEMENTS-1:0];
reg [ELEMENTS_W-1:0] readaddress_r;

assign readdata = storage[readaddress_r];

always @(posedge clk) begin
	if(write) begin
		storage[writeaddress] <= writedata;
	end
	if(read)
		readaddress_r <= readaddress;
end

endmodule