/*
	Acciones de evento de grupo 6
*/

function cambiar_tono_pantalla(int valor1,int valor2,int valor3,int valor4)
	begin
		tono[0]=valor1;
		tono[1]=valor2;
		tono[2]=valor3;
		tono[3]=valor4;
	end
	
function flash_pantalla()
	begin
		flash=true;
		while(flash) frame; end
	end
	
function sacudir_pantalla(int frames)
	private
		int izq,i;
	end
	begin
		for(i=0;i<frames;i++)
			if(desv_x>50)
				izq=false;
			elsif(desv_x<-50)
				izq=true;
			end
			
			if(izq)
				desv_x+=20;
			else
				desv_x-=20;
			end
			frame;
		end
		desv_x=0;
	end