module top_module(
	input clk50MHz,
	input rst,
	input up,
	input down,
	input right,
	input left,
	input button,
	output [2:0] red, 
	output [2:0] green, 
	output [1:0] blue, 
	output hsync, 
	output vsync
	
    );
	 
	 //wire reset;
	 wire clk25MHz;
	 wire [2:0] step;
	 wire [1:0] actionA;
	 wire [1:0] actionB;
	 wire [1:0] actionC;
	 wire [1:0] actionD;
	 wire [2:0] variety;
	 wire [2:0] variety1;
	 wire [2:0] match;
	 wire winscreen;
	 
	clkDivider	M1	(	.clkIn(clk50MHz), 
							.rst(rst), 
							.clkOut(clk25MHz)
														);
						
	vga640x480	M2 ( 	.clk25MHz(clk25MHz),
							.rst(rst),
							.red(red), 
							.green(green), 
							.blue(blue), 
							.hsync(hsync), 
							.vsync(vsync),
							.actionA(actionA),
							.actionB(actionB),
							.actionC(actionC),
							.actionD(actionD),
							.winscreen(winscreen)
														);
														
	step_button M3 (  .button(button),
							.variety(variety),
							.match(match),
							.step(step),
							.rst(rst)
														);
														
	choose      M4 (	.clk25MHz(clk25MHz),
							.up(up),
							.down(down),
							.right(right),
							.left(left),
							.step(step),
							.variety(variety)
														);
	
	step1			M5	(	.clk25MHz(clk25MHz),
							.up(up),
							.down(down),
							.right(right),
							.left(left),
							.step(step),
							.variety(variety),
							.match(match)
														);
	step3      M6	(	.clk25MHz(clk25MHz),
							.up(up),
							.down(down),
							.right(right),
							.left(left),
							.step(step),
							.variety(variety),
							.variety1(variety1)
														);
	
													
	aksiyon		M7 (  .clk25MHz(clk25MHz),
							.variety(variety),
							.match(match),
							.step(step),
							.actionA(actionA),
							.actionB(actionB),
							.actionC(actionC),
							.actionD(actionD),
							.variety1(variety1),
							.winscreen(winscreen)
														);
							


endmodule
