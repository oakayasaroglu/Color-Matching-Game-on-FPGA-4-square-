module aksiyon(
	input clk25MHz,
	input [2:0] variety,
	input	[2:0] match,
	input [2:0] step,
	input [2:0] variety1,
	
	output reg [1:0] actionA,
	output reg [1:0] actionB,
	output reg [1:0] actionC,
	output reg [1:0] actionD,
	output reg winscreen
    );
	
	
	initial begin
		actionA <= 2'b01;
		actionB <= 2'b00;
		actionC <= 2'b00;
		actionD <= 2'b00;
		winscreen<=0;
	end
	
	always@(posedge clk25MHz)begin
		if(step==3'b000)begin
			if(variety==3'b000)begin
				actionA <= 2'b01;
				actionB <= 2'b00;
				actionC <= 2'b00;
				actionD <= 2'b00;
			end
			else if(variety==3'b001)begin
				actionA <= 2'b00;
				actionB <= 2'b01;
				actionC <= 2'b00;
				actionD <= 2'b00;
			end
			else if(variety==3'b010)begin
				actionA <= 2'b00;
				actionB <= 2'b00;
				actionC <= 2'b01;
				actionD <= 2'b00;
			end
			else if(variety==3'b011)begin
				actionA <= 2'b00;
				actionB <= 2'b00;
				actionC <= 2'b00;
				actionD <= 2'b01;
			end
		end
		else if(step==3'b001)begin
			if(variety==3'b000)
				actionA<=2'b10;
			else if(match==3'b000)
				actionA<=2'b01;		
			else
				actionA<=2'b00;
				
			if(variety==3'b001)
				actionB<=2'b10;
			else if(match==3'b001)
				actionB<=2'b01;		
			else
				actionB<=2'b00;
				
			if(variety==3'b010)
				actionC<=2'b10;
			else if(match==3'b010)
				actionC<=2'b01;		
			else
				actionC<=2'b00;
				
			if(variety==3'b011)
				actionD<=2'b10;
			else if(match==3'b011)
				actionD<=2'b01;		
			else
				actionD<=2'b00;
			
		end
		else if(step==3'b010)begin
			if(match==3'b000)
				actionA<=2'b10;
			else if(match==3'b001)
				actionB<=2'b10;
			else if(match==3'b010)
				actionC<=2'b10;
			else if(match==3'b011)
				actionD<=2'b10;
				
		end
		else if(step==3'b011)begin
			if((match==3'b000 && variety==3'b011) || (match==3'b011&& variety==3'b000) )begin
					actionA<=2'b11;
					actionD<=2'b11;
			end
			else if((match==3'b001&& variety==3'b010) || (match==3'b010&& variety==3'b001) )begin
					actionB<=2'b11;
					actionC<=2'b11;
			end
			if(variety1==3'b000)begin
				actionA<=2'b01;
				actionD<=2'b00;
			end
			else if(variety1==3'b001)begin
				actionB<=2'b01;
				actionC<=2'b00;
			end
			else if(variety1==3'b010)begin
				actionC<=2'b01;
				actionB<=2'b00;
			end
			else if(variety1==3'b011)begin
				actionD<=2'b01;
				actionA<=2'b00;
			end
			
		end
		else if(step==3'b100)begin
			if(variety1==3'b000)begin
				actionA<=2'b10;
				actionD<=2'b01;
			end
			else if(variety1==3'b001)begin
				actionB<=2'b10;
				actionC<=2'b01;
			end
			else if(variety1==3'b010)begin
				actionC<=2'b10;
				actionB<=2'b01;
			end
			else if(variety1==3'b011)begin
				actionD<=2'b10;
				actionA<=2'b01;
			end
		end
		else if(step==3'b101)begin
			if(variety1==3'b000)
				actionD<=2'b10;
			else if(variety1==3'b001)
				actionC<=2'b10;
			else if(variety1==3'b010)
				actionB<=2'b10;
			else if(variety1==3'b011)
				actionA<=2'b10;
		end
		else if(step==3'b110)
			winscreen<=1;
	end
	

endmodule
