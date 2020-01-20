module vga640x480( 	input clk25MHz,
							input rst,
							output reg [2:0] red, 
							output reg [2:0] green, 
							output reg [1:0] blue,
							
							input [1:0] actionA,
							input [1:0] actionB,
							input [1:0] actionC,
							input [1:0] actionD,
							input winscreen,
							
							output hsync, 
							output vsync
							
																);

	parameter hpulse = 96; 	// hsync pulse length
	parameter vpulse = 2; 	// vsync pulse length
	parameter hbp = 144; 	// end of horizontal back porch //=144
	parameter hfp = 784; 	// beginning of horizontal front porch //=784
	parameter vbp = 31; 		// end of vertical back porch//=31
	parameter vfp = 511; 	// beginning of vertical front porch//=511
	parameter hPixels = 800;	// horizontal pixels per line = 800
	parameter vLines = 521; 	// vertical lines per frame	= 521
	
	reg [9:0] hc,vc;
	
	assign hsync = (hc < hpulse) ? 0:1;
	assign vsync = (vc < vpulse) ? 0:1;
	
	integer delay1=0;
	
	always @(posedge clk25MHz or posedge rst) begin
		if (rst == 1) begin
			hc <= 0;
			vc <= 0;
		end
		else begin
			if (hc < hPixels - 1)
				hc <= hc + 1;
			else begin
				hc <= 0;
				if (vc < vLines - 1)
					vc <= vc + 1;
				else
					vc <= 0;
			end
		end
	end

	always @(posedge clk25MHz or posedge rst) begin
		if(rst == 1) begin
			red 	<= 3'b000;	
			green <= 3'b000;	
			blue 	<= 2'b00;
		end
		else begin
			if (vc >= vbp && vc < vfp && hc >= hbp && hc < hfp) begin
				if(winscreen==0)begin
					if ((hc >= (hbp+96) && hc < (hbp+288)) && vc >= (vbp+ 72) && vc < (vbp+216) ) begin // display yellow bar		
						
						if(actionA==2'b00)begin
								red <= 3'b111;
								green <= 3'b111;
								blue <= 2'b00;
							end
							else if(actionA==2'b01)begin
								if(delay1>=0 && delay1<=1000000) begin                       // burada sarý rengin yanýp sönmesini saðlayan kod baþlýyor
									red <= 3'b111;
									green <= 3'b111;
									blue <= 2'b00;
								end
							
								else if(delay1>1000000 && delay1<=2000000)begin
									red <= 3'b000;
									green <= 3'b000;
									blue <= 2'b00;					
								end
							
								if(delay1==2000000)
									delay1=0;
								else 
									delay1=delay1+1;                                              //burada sarý rengin yanýp sönmesini saðlayan kod bitiyor 
							end
							else if(actionA==2'b10)begin
								red <= 3'b111;
								green <= 3'b000;
								blue <= 2'b00;
							end
							else begin
								red <= 3'b000;
								green <= 3'b000;
								blue <= 2'b00;
							end	
					
					end
					else if ((hc >= (hbp+96) && hc < (hbp+288)) && (vc >= (vbp+264) && vc < (vbp+408))) begin // display yellow bar
						if(actionC==2'b00)begin
								red <= 3'b111;
								green <= 3'b111;
								blue <= 2'b00;
							end
							else if(actionC==2'b01)begin
								if(delay1>=0 && delay1<=1000000) begin                       // burada sarý rengin yanýp sönmesini saðlayan kod baþlýyor
									red <= 3'b111;
									green <= 3'b111;
									blue <= 2'b00;
								end
							
								else if(delay1>1000000 && delay1<=2000000)begin
									red <= 3'b000;
									green <= 3'b000;
									blue <= 2'b00;					
								end
							
								if(delay1==2000000)
									delay1=0;
								else 
									delay1=delay1+1;                                              //burada sarý rengin yanýp sönmesini saðlayan kod bitiyor 
							end
							else if(actionC==2'b10)begin
								red <= 3'b000;
								green <= 3'b000;
								blue <= 2'b11;
							end
							else begin
								red <= 3'b000;
								green <= 3'b000;
								blue <= 2'b00;
							end
					end
					else if ((hc >= (hbp+352) && hc < (hbp+544)) && (vc >= (vbp+ 72) && vc < (vbp+216))) begin // display yellow bar
						if(actionB==2'b00)begin
								red <= 3'b111;
								green <= 3'b111;
								blue <= 2'b00;
							end
							else if(actionB==2'b01)begin
								if(delay1>=0 && delay1<=1000000) begin                       // burada sarý rengin yanýp sönmesini saðlayan kod baþlýyor
									red <= 3'b111;
									green <= 3'b111;
									blue <= 2'b00;
								end
							
								else if(delay1>1000000 && delay1<=2000000)begin
									red <= 3'b000;
									green <= 3'b000;
									blue <= 2'b00;					
								end
							
								if(delay1==2000000)
									delay1=0;
								else 
									delay1=delay1+1;                                              //burada sarý rengin yanýp sönmesini saðlayan kod bitiyor 
							end
							else if(actionB==2'b10)begin
								red <= 3'b000;
								green <= 3'b000;
								blue <= 2'b11;
							end
							else begin
								red <= 3'b000;
								green <= 3'b000;
								blue <= 2'b00;
							end
					end
					else if ((hc >= (hbp+352) && hc < (hbp+544)) && (vc >= (vbp+264) && vc < (vbp+408))) begin // display yellow bar
						if(actionD==2'b00)begin
							red <= 3'b111;
							green <= 3'b111;
							blue <= 2'b00;
						end
						else if(actionD==2'b01)begin
							if(delay1>=0 && delay1<=1000000) begin                       // burada sarý rengin yanýp sönmesini saðlayan kod baþlýyor
								red <= 3'b111;
								green <= 3'b111;
								blue <= 2'b00;
							end
							
							else if(delay1>1000000 && delay1<=2000000)begin
								red <= 3'b000;
								green <= 3'b000;
								blue <= 2'b00;					
							end
							
							if(delay1==2000000)
								delay1=0;
							else 
								delay1=delay1+1;                                              //burada sarý rengin yanýp sönmesini saðlayan kod bitiyor 
						end
						else if(actionD==2'b10)begin
							red <= 3'b111;
							green <= 3'b000;
							blue <= 2'b00;
						end
						else begin
							red <= 3'b000;
							green <= 3'b000;
							blue <= 2'b00;
						end
					end
					
					else begin 
						red <= 3'b000;
						green <= 3'b000;
						blue <= 2'b00;
					end
			end
			
			else if (winscreen==1) begin
				if((hc >= (hbp+96) && hc < (hbp+544)) && (vc >= (vbp+72) && vc < (vbp+408))) begin
					red <= 3'b000;
					green <= 3'b111;
					blue <= 2'b00;
				end
				else begin
					red <= 3'b000;
					green <= 3'b000;
					blue <= 2'b00;	
				end
			end
		end
		end
	end

endmodule	


