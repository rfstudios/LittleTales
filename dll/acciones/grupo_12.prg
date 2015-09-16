/*
	Acciones de evento de grupo 12
*/

function set_variable(int id_obj,int valor)
	begin
		actualizar_partida("Variable"+id_obj,valor);
	end
	
function si_variable(int id_obj,int valor,int lineasi,int lineano)
	private
		int variable;
	end
	begin
		variable=buscar("Variable"+id_obj,11);
		if(variable!=valor)
			go_to(lineano,1);
		else
			go_to(lineasi,1);
		end
	end
	
function cambiar_variable(int id_obj,int cantidad,int operacion)
	private
		int variable;
	end
	begin
		variable=buscar("Variable"+id_obj,11);
		switch(operacion)
			case 0: //Suma
				variable+=cantidad;			
			end
			case 1: //Resta
				variable-=cantidad;	
			end
			case 2: //Multip
				variable*=cantidad;	
			end
			case 3: //Divis
				variable/=cantidad;	
			end
		end
		set_variable(id_obj,variable);	
	end