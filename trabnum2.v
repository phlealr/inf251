module ff ( input data, input c, input r, output q);
	reg q;
	always @(posedge c or negedge r) 
	begin
	 if(r==1'b0)
	  q <= 1'b0; 
	 else 
	  q <= data; 
	end 
endmodule 

//CODIGO COM CASE
module maqestado(clk, reset, a, out);
	input clk,reset,a;
	output [2:0] out;
	reg[2:0] estado;
	parameter dois=3'd0, cinco=3'd2, seis=3'd3, quatro=3'd4 sete=3'd5;
	assign out = estado;
	
always @(posedge clk or negedge reset)
	begin
		if(reset==0)
			estado = zero;
		else
			case(estado)
				dois: estado = seis;
				seis:if(a) estado = sete;
					 else estado = cinco;
				cinco: estado = quatro;
				quatro: if(a) estado = seis;
						else estado = dois;
				sete: estado = cinco;
			endcase
	end
endmodule

//CODIGO COM PORTAS LOGICAS
module maqportas(input clk, input res, input a, output [2:0] s);
	wire[2:0] e;
	wire[2:0] p,
	assign s[0] = e[1]&e[2]; //1 operador
	assign s[1] = e[2]&~e[1]&e[0] + e[1]&e[2]&~e[0]; //7 operadores
	assign s[2] = e[0]&e[1] + e[2]&~e[1]&~e[0]; //6 operadores
	assign p[0] = e[1]&e[2]; //1 operador
	assign p[1] = ~e[2]&~e[0] + a&~e[0] + e[2]&~e[1]&~e[0]; //9 operadores
	assign p[2] = e[1]&~e[0] + a&e[2] + e[2]&e[0]; //6 operadores
	//total de 30 operadores
	ff  e0(p[0],clk,res,e[0]);
	ff  e1(p[1],clk,res,e[1]);
	ff  e2(p[2],clk,res,e[2]);
endmodule

//CODIGO COM MEMORIA
module maqmemoria(input clk,input res, input a, input[2:0] entrada, output [2:0] saida);
	reg [5:0] StateMachine [0:15];
	initial
	begin
		StateMachine[0] = 6'h10;  StateMachine[8] = 6'h14;
		StateMachine[1] = 6'h20;  StateMachine[9] = 6'h34;
		StateMachine[3] = 6'h20;  StateMachine[11] = 6'h25;  
		StateMachine[2] = 6'h10;  StateMachine[10] = 6'h25;
		StateMachine[6] = 6'h10;  StateMachine[14] = 6'h2F;
		StateMachine[7] = 6'h20;  StateMachine[15] = 6'h2F;
		StateMachine[5] = 6'h32;  StateMachine[13] = 6'h2E;
		StateMachine[4] = 6'h32;  StateMachine[12] = 6'h2E;
	end
	wire [3:0] address;  
	wire [5:0] dout; 
	assign address[3] = a;
	assign dout = StateMachine[address];
	assign sd = dout[2:0];
	ff st0(dout[3],clk,res,address[0]);
	ff st1(dout[4],clk,res,address[1]);
	ff st2(dout[5],clk,res,address[2]);
endmodule
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	