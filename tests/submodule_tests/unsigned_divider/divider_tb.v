////////////////////////////////////////////////////////////////////////////////
// 
// This file is part of ArmleoCPU.
// ArmleoCPU is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// ArmleoCPU is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with ArmleoCPU.  If not, see <https://www.gnu.org/licenses/>.
// 
// Copyright (C) 2016-2021, Arman Avetisyan, see COPYING file or LICENSE file
// SPDX-License-Identifier: GPL-3.0-or-later
// 

`define TIMEOUT 1000
`define SYNC_RST
`define CLK_HALF_PERIOD 1

`include "template.vh"

reg         fetch;
reg [31:0]  dividend;
reg [31:0]  divisor;

wire        ready;
wire		division_by_zero;

wire [31:0] quotient;
wire [31:0] remainder;

armleocpu_unsigned_divider divider(
	.*
);

initial begin
	fetch <= 0;
	@(posedge rst_n);
	@(posedge clk)
	$display("Test 0");
	fetch <= 1;
	dividend <= 32'hFFFF_FFFF;
	divisor <= 32'hFFFF_FFFE;
	@(posedge clk)
	fetch <= 0;

	while(ready != 1)
		@(posedge clk);
	`assert_equal(quotient, 32'hFFFF_FFFF / 32'hFFFF_FFFE);
	`assert_equal(remainder, 32'hFFFF_FFFF % 32'hFFFF_FFFE);

	$display("Test 1");

	fetch <= 1;
	dividend <= 53*2;
	divisor <= 53;
	@(posedge clk)
	fetch <= 0;
	while(ready != 1)
		@(posedge clk);
	`assert_equal(quotient, 2);
	`assert_equal(remainder, 0);
	$display("Test 2");
	fetch <= 1;
	dividend <= 32'h1;
	divisor <= 32'h1;
	@(posedge clk)
	fetch <= 0;

	while(ready != 1)
		@(posedge clk);
	`assert_equal(quotient, 1);
	`assert_equal(remainder, 0);
	$display("Test 3");
	fetch <= 1;
	dividend <= 32'hFFFF_FFFF;
	divisor <= 32'hFFFF_FFFF;
	@(posedge clk)
	fetch <= 0;

	while(ready != 1)
		@(posedge clk);
	`assert_equal(quotient, 1);
	`assert_equal(remainder, 0);
	@(posedge clk);


	$display("Test 4");
	fetch <= 1;
	dividend <= 21;
	divisor <= 3;
	@(posedge clk)
	fetch <= 0;

	while(ready != 1)
		@(posedge clk);
	`assert_equal(quotient, 7);
	`assert_equal(remainder, 0);

	$display("Test 5");
	fetch <= 1;
	dividend <= 20;
	divisor <= 3;
	@(posedge clk)
	fetch <= 0;

	while(ready != 1)
		@(posedge clk);
	`assert_equal(quotient, 6);
	`assert_equal(remainder, 2);

	$display("Test 6");
	fetch <= 1;
	dividend <= 20;
	divisor <= 3;
	@(posedge clk)
	fetch <= 0;

	while(ready != 1)
		@(posedge clk);
	$display("%d", $signed(quotient));
	$display("%d", $signed(remainder));
	//`assert_equal(quotient, 6);
	//`assert_equal(remainder, 2);

	$display("Test 7");
	fetch <= 1;
	dividend <= 2147483648;
	divisor <= 1;
	@(posedge clk)
	fetch <= 0;

	while(ready != 1)
		@(posedge clk);
	$display("%d", $signed(quotient));
	$display("%d", $signed(remainder));

	@(posedge clk);
	$finish;
end
endmodule