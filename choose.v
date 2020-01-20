module choose(
	input clk25MHz,
	input up,
	input down,
	input right,
	input left,
	input [2:0] step,
	
	output reg [2:0] variety
    );
	 
	 parameter [2:0] kare0=3'b000, kare1=3'b001, kare2=3'b010, kare3=3'b011;
	 integer mover=0;
	initial
		variety<=3'b000;
	
	
	always@(posedge clk25MHz)begin
		if(step==3'b000)begin
			if(up)begin
				if(mover==0)begin
					mover=1;
					if(variety==3'b000)
						variety=kare3;
					else if(variety==3'b001)
						variety=kare2;
					else if(variety==3'b010)
						variety=kare0;
					else if(variety==3'b011)
						variety=kare1;
				end
			end
			else if(down)begin
				if(mover==0)begin
					mover=1;
					if(variety==3'b000)
						variety=kare2;
					else if(variety==3'b001)
						variety=kare3;
					else if(variety==3'b010)
						variety=kare1;
					else if(variety==3'b011)
						variety=kare0;
				end
			end
			else if(right)begin
				if(mover==0)begin
					mover=1;
					if(variety==3'b000)
						variety=kare1;
					else if(variety==3'b001)
						variety=kare2;
					else if(variety==3'b010)
						variety=kare3;
					else if(variety==3'b011)
						variety=kare0;		
				end
			end
			else if(left)begin
				if(mover==0)begin
					mover=1;
					if(variety==3'b000)
						variety=kare3;
					else if(variety==3'b001)
						variety=kare0;
					else if(variety==3'b010)
						variety=kare1;
					else if(variety==3'b011)
						variety=kare2;
				end
			end
			else 
				mover=0;
		end
	end

endmodule
