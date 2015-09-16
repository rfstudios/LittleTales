/*
	Este archivo contiene el panel de control de personajes
*/

process panel()
	private
		_lista* actual;
		int posiciones[4],chars,i,j;
	end
	begin
		x=modo_x/2;
		y=modo_y-72;
		file=fpgs[1];
		graph=4;
		size_y=20;
		z=98;
		
		/* Posiciones de los personajes */
			posiciones[0]=80;
			posiciones[1]=375;
			posiciones[2]=670;
			posiciones[3]=965;
		
		i=0;
		chars=buscar("contar",3); /* Contamos cuántos personajes hay en la bd */
		for(id_obj=0;id_obj<chars;id_obj++)
			j=buscar("ingroup",3); /* Miramos si el pj que estamos mirando está en el grupo */
			if(j!=0) /* Si lo está */
				cargar_pejota(pj(id_obj,posiciones[i],modo_y-75));
				i++;
			end
		end
		
		repeat frame; until(onoff!=false); /* Esperamos a que la batalla empiece */
		repeat frame; until(onoff!=true);  /* Esperamos a que la batalla termine */
	end
	
process pj(int id_obj,int x,int y)
	private
		string testo,pvtesto;
		int estado=0; /* 0: Recargando/Esperando, 1:Combatiendo, 2:Terminando turno*/
		bool sitio=false;
		int iniciativa,pv,pvmax,tespera,contatiempo;
	end
	begin
		size=50;
		file=fpgs[2];
		graph=buscar("b_graph",3);
		
		testo=buscar("nombre",3);
		write(fnts[1],x+60,y-35,3,testo);
		
		iniciativa=buscar("iniciativa",12);
		pvtesto=buscar("pv",12);
		pv=buscar("pv",3);
		pvmax=buscar("pv_max",3);
		testo=pvtesto+": "+pv+"/"+pvmax; 
		write_var(fnts[2],x+60,y,3,testo);
		
		
		repeat frame; until(onoff!=false) /* Esperamos a que empiece la batalla */
		repeat
			while(caballito_blanco==true)
				log("Caballito blanco");
				frame; 
			end
			
			testo=pvtesto+": "+pv+"/"+pvmax;
			
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
					size=100;
					
					esperar(240);
					
					tablon[1]=1;
					estado=3;
				end
				case 3:
					if(tablon[0]!=id)
						size=50;
						sitio=false;
						estado=0;
					end
				end
			end
			frame;
		until(onoff!=true) /* Esperamos a que termine la batalla */
		
	OnExit
		delete_text(0);
	end