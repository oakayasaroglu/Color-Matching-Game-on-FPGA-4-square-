module step3(	input clk25MHz,
					input up,
					input down,
					input right,
					input left,
					input [2:0] step,
					input [2:0] variety,
					
					output reg [2:0] variety1
													);

	parameter [2:0] kare0=3'b000, kare1=3'b001, kare2=3'b010, kare3=3'b011;
	integer mover=0;
	always@(posedge clk25MHz)begin
		if(step==3'b011)begin
			if(mover==0)begin
				mover=1;
				if((variety == kare0) || (variety == kare3))
					variety1=kare1;
				else if((variety == kare1) || (variety == kare2))
					variety1=kare0;
			end
			if(up || down || right || left)begin
				if(mover == 1)begin
					mover=2;
					if(variety1==kare0)
						variety1=kare3;
					else if(variety1==kare1)
						variety1=kare2;
					else if(variety1==kare2)
						variety1=kare1;
					else if(variety1==kare3)
						variety1=kare0;
				end
			end
			else
				mover = 1;
		end
	end







endmodule
