module step1(
	input clk25MHz,
	input up,
	input down,
	input right,
	input left,
	input [2:0] step,
	input [2:0] variety,
	output reg [2:0] match
    );
	 
	 parameter [2:0] kare0=3'b000, kare1=3'b001, kare2=3'b010, kare3=3'b011;
	 integer mover=0;
	initial 
		match<=kare0;
	
	always@(posedge clk25MHz)begin
		if(step==3'b001)begin
			if(up==0 && down==0 && right==0 && left==0 && (variety==match))
				match=kare1;
			if(up)begin
				if(mover==0)begin
					mover=1;
					if(match==3'b000)
						match=kare3;	
					else if(match==3'b001)
						match=kare2;
					else if(match==3'b010)
						match=kare0;
					else if(match==3'b011)
						match=kare1;
				end
			end
			else if(down)begin
				if(mover==0)begin
					mover=1;
					if(match==3'b000)
						match=kare2;	
					else if(match==3'b001)
						match=kare3;
					else if(match==3'b010)
						match=kare1;
					else if(match==3'b011)
						match=kare0;
				end
			end
			else if(right)begin
				if(mover==0)begin
					mover=1;
					if(match==3'b000)
						match=kare1;	
					else if(match==3'b001)
						match=kare2;
					else if(match==3'b010)
						match=kare3;
					else if(match==3'b011)
						match=kare0;
				end
			end
			else if(left)begin
				if(mover==0)begin
					mover=1;
					if(match==3'b000)
						match=kare3;	
					else if(match==3'b001)
						match=kare0;
					else if(match==3'b010)
						match=kare1;
					else if(match==3'b011)
						match=kare2;
				end
			end
			else 
				mover=0;
			if (variety==match)
				mover=0;
		end
	end

endmodule
