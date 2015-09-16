/*
	Este fichero contiene a los enemigos
*/

process enemigo(int id_obj,int x, int y)
	private
		string nombre;
		int pv,iniciativa,tespera,contatiempo;
		int estado=0; /* 0: Recargando/Esperando, 1:Combatiendo, 2:Terminando turno*/
		bool sitio=false;
	end
	begin
		z=(modo_y-y)/100;
		file=fpgs[6];
		graph=buscar("graf",13);
		nombre=buscar("nombre",13);
		pv=buscar("pv",13);
		iniciativa=buscar("iniciativa",13);
		
		repeat frame; until(onoff!=false) /* Esperamos a que empiece la batalla */
		
		repeat
			while(caballito_blanco==true) frame; end
			switch(estado)
				case 0:
					tespera=rand(95,100)-iniciativa; /* Calculamos cuánto tendrá que esperar */
					contatiempo=0;
					estado=1;
				end
				case 1:
					if(contatiempo>tespera)
						if(!sitio) 
							cargar_turno(id); 
							sitio=true;
						end
						if(tablon[0]==id)
							estado=2;
						end
					else
						contatiempo++;
					end
				end
				case 2:
					size=200;
					
					esperar(240);
					
					tablon[1]=1;
					estado=3;
				end
				case 3:
					if(tablon[0]!=id)
						size=100;
						sitio=false;
						estado=0;
					end
				end
			end
			frame;
		until(onoff!=true) /* Esperamos a que termine la batalla */
	end