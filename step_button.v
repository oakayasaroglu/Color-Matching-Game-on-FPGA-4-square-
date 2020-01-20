module step_button(
	input button,
	input [2:0] variety,
	input [2:0] match,
	output reg [2:0] step,
	input rst
    );
	 
	 initial 
		step<=3'b000;
	 
	 
	 always@(posedge button or posedge rst)begin
		if(rst)
			step<=3'b000;
		else begin
			if(step==3'b000)
				step<=3'b001;
			else if(step==3'b001)
				step<=3'b010;
			else if(step==3'b010)begin
				if((match==3'b000 && variety==3'b011) || (match==3'b011 && variety==3'b000) || (match==3'b001&& variety==3'b010) || (match==3'b010&& variety==3'b001))
					step<=3'b011;
				else
					step<=3'b000;
			end
			else if(step==3'b011)
				step<=3'b100;
			else if(step==3'b100)
				step<=3'b101;
			else if(step==3'b101)
				step<=3'b110;	
		end
	 end


endmodule
