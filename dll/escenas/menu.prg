/*
  Este archivo contiene el menú principal
*/

function mainmenu()
	private
		int curs; /* Aqui se guarda el id del proceso "cursor" */
		string texto;
		int i;
		int opc_coord[3][2];
	end
	begin
		cambiar_musica(0);
		
		/* Fundido desde negro */
			cambiar_tono_pantalla(0,0,0,0);
			fade(100,100,100,30);
			while(fading)
				frame;
			end
			
		menutype=1;
		log("Entrando en... menu principal");
				
		screen_put(fpgs[1],1);
		curs=cursor();
		
		for(i=1;i<=3;i++)
			texto=buscar(i,2); write(fnts[0],x,y,5,texto);
			opc_coord[i-1][0]=x;
			opc_coord[i-1][1]=y;
		end
		
		curs.x=opc_coord[0][0]+50;
		curs.y=opc_coord[0][1];
		i=0;
		loop
			if(key(_seleccionar))					
				while(key(_seleccionar))
					frame;
				end
				break;
			end
			if(key(_menuabajo) || key(_abajopersonaje))				
				i++;
				if(i>2)
					i=0;
				end
				
				while(key(_menuabajo) || key(_abajopersonaje))
					frame;
				end
			end
			if(key(_menuarriba) || key(_arribapersonaje))				
				i--;
				if(i<0)
					i=2;
				end
				
				while(key(_menuarriba) || key(_arribapersonaje))
					frame;
				end
			end
				
			curs.y=opc_coord[i][1];			
			frame;
		end
			
		/* Hacemos un fundido a negro */
			fade(0,0,0,30);
			while(fading)
				frame;
			end
		return i;
	OnExit
		signal(curs,s_kill);
		delete_text(0);
		clear_screen();
	end
	
function optionmenu()
	private
		int curs; /* Aqui se guarda el id del proceso "cursor" */
		string texto;
		int i,j;
		int opc_coord[3][2];
	end
	begin
		/* Fundido desde negro */
			fade(100,100,100,30);
			while(fading)
				frame;
			end
		menutype=2;
		log("Entrando en... menu de opciones");

		file=fpgs[1];
		screen_put(fpgs[1],1);
		curs=cursor();
		
		for(i=1;i<=4;i++)
			texto=buscar(i,2); write(fnts[0],x,y,5,texto);
			opc_coord[i-1][0]=x;
			opc_coord[i-1][1]=y;
		end
		
		curs.x=opc_coord[0][0]+50;
		curs.y=opc_coord[0][1];
		j=0;
		repeat
			loop
				curs.x=opc_coord[j][0]+50;
				curs.y=opc_coord[j][1];
				
				if(key(_seleccionar))					
					while(key(_seleccionar))
						frame;
					end
					break;
				end
				if(key(_menuabajo) || key(_abajopersonaje))				
					j++;
					if(j>3)
						j=0;
					end
				
					while(key(_menuabajo) || key(_abajopersonaje))
						frame;
					end
				end
				if(key(_menuarriba) || key(_arribapersonaje))				
					j--;
					if(j<0)
						j=3;
					end
				
					while(key(_menuarriba) || key(_arribapersonaje))
						frame;
					end
				end		
				frame;
			end
			
			curs.graph=0;
			signal(curs,s_freeze);
			delete_text(0);
			switch(j)
				case 0:
					x=modo_x/2;
					y=modo_y/2;
					graph=2;
					optionpanel(3);
					graph=0;
				end
				case 1:
					x=modo_x/2;
					y=modo_y/2;			
					graph=2;
					optionpanel(4);
					graph=0;
				end
				case 2:
					SQLITE3_CLOSE(db);
					if(fexists(filepath)) rm(filepath); log("Db borrada"); end
					texto="dll/original.yawdb";
					
					/*Copiar bd*/
						fcopia(texto,filepath);
					
					basededatos();
					log("Partida reiniciada");
					j=3;
				end
			end	
			
			for(i=1;i<=4;i++)
				texto=buscar(i,2); write(fnts[0],x,y,5,texto);
				opc_coord[i-1][0]=x;
				opc_coord[i-1][1]=y;
			end
			signal(curs,s_wakeup);
			curs.graph=4;
		until(j==3 || key(_escape))
		while(key(_escape)) frame; end
		/* Hacemos un fundido a negro */
			fade(0,0,0,30);
			while(fading)
				frame;
			end
	OnExit
		signal(curs,s_kill);
		delete_text(0);
	end
	
function optionpanel(int menutype)
	private
		int curs; /* Aqui se guarda el id del proceso "cursor" */
		string texto;
		int i;
		int opc_coord[5][2];
		int cantidad; /* cantidad de elementos del menú (a mejorar) */
	end
	begin
		log("Entrando en... panel de opciones "+menutype);
		
		curs=cursor();
		if(menutype==3)
			cantidad=3;
		else
			cantidad=5;
		end
		
		for(i=1;i<=cantidad;i++)
			texto=buscar(i,2); write(fnts[0],x,y,5,texto);
			opc_coord[i-1][0]=x;
			opc_coord[i-1][1]=y;
		end
		
		curs.x=opc_coord[0][0]+50;
		curs.y=opc_coord[0][1];
		i=0;
		
		loop
			if(key(_seleccionar))					
				while(key(_seleccionar))
					frame;
				end
				break;
			end
			if(key(_menuabajo) || key(_abajopersonaje))				
				i++;
				if(i>cantidad-1)
					i=0;
				end
			
				while(key(_menuabajo) || key(_abajopersonaje))
					frame;
				end
			end
			if(key(_menuarriba) || key(_arribapersonaje))				
				i--;
				if(i<0)
					i=cantidad-1;
				end
			
				while(key(_menuarriba) || key(_arribapersonaje))
					frame;
				end
			end
			curs.y=opc_coord[i][0]+50;
			curs.y=opc_coord[i][1];
			frame;
		end
		switch(menutype)
			case 3:
				switch(i)
					case 0:
						guardar_lang("es_ES");
					end
					case 1:
						guardar_lang("eu");					
					end
					case 2:
						guardar_lang("en_EN");					
					end
				end
			end
			case 4:
				switch(i)
					case 0:
						guardar_escala("12800720");
					end
					case 1:
						guardar_escala("10240576");
					end
					case 2:
						guardar_escala("08520480");
					end
					case 3:
						guardar_escala("08000450");
					end
					case 4:
						guardar_escala("06400360");
					end
				end
			end
		end
	OnExit
		signal(curs,s_kill);
		delete_text(0);
	end
	
function ingmenu()
	private
		int curs; /* Aqui se guarda el id del proceso "cursor" */
		string texto;
		int i,k=0,chars,j,posy;
		int opc_coord[3][2];
		int salida=0,retorno;
	end
	begin		
		/* Fundido desde negro */
			cambiar_tono_pantalla(0,0,0,0);
			fade(100,100,100,30);
			while(fading)
				frame;
			end
			
		menutype=5;
		log("Entrando en... menu de juego");
		
		file=fpgs[1];
		graph=3;
		z=21;
		curs=cursor();
		
		repeat
			for(i=1;i<=3;i++)
				texto=buscar(i,2); write(fnts[1],x,y,3,texto);
				opc_coord[i-1][0]=x;
				opc_coord[i-1][1]=y;
			end
			x=modo_x/2;
			y=modo_y/2;
			
			curs.x=opc_coord[0][0]-40;
			curs.y=opc_coord[0][1]+10;
			i=0;
		
			chars=buscar("contar",3);
			posy=0;
			k=0;
			for(id_obj=0;id_obj<chars;id_obj++)
				j=buscar("ingroup",3);
				if(j!=0)
					k++;
					posy+=44;
					texto=buscar("nombre",3); write(fnts[1],98,posy,3,texto);
					posy+=44;
					texto=buscar("nivel",12)+" "+buscar("nivel",3)+"   "+buscar("pv",12)+": "+buscar("pv",3)+"/"+buscar("pv_max",3)+"   "+buscar("iniciativa_comp",12)+": "+buscar("iniciativa",3); write(fnts[2],98,posy,3,texto);
					posy+=30;
					animacion(50,posy-55,19,2,buscar("graph",3),4,4,0);
				end
			end
			id_obj=0; texto=buscar("cash",12)+": "+buscar("dinero",3)+" [moneda]"; write(fnts[2],967,693,3,texto);
		
			loop
				if(key(_seleccionar))					
					while(key(_seleccionar))
						frame;
					end
					break;
				end
				if(key(_escape))
					salida=1;
					while(key(_escape))
						frame;
					end
					break;
				end
				if(key(_menuabajo) || key(_abajopersonaje))				
					i++;
					if(i>2)
						i=0;
					end
			
					while(key(_menuabajo) || key(_abajopersonaje))
						frame;
					end
				end
				if(key(_menuarriba) || key(_arribapersonaje))				
					i--;
					if(i<0)
						i=2;
					end
			
					while(key(_menuarriba) || key(_arribapersonaje))
						frame;
					end
				end
			
				curs.y=opc_coord[i][1]+10;			
				frame;
			end
			if(salida!=1)
				curs.graph=0;
				switch(i)
					case 0:
						curs.graph=0;
						retorno=selecperso(k);
						if(retorno!=-1)
							delete_text(0);
							statsmenu(retorno); 
						end
					end
					case 1:
						retorno=selecperso(retorno);
						if(retorno!=-1)
							delete_text(0);
							skillsmenu(); 
						end
					end
					case 3:
			
					end
				end
				curs.graph=4;
			end
			delete_text(0);
			signal(type animacion,s_kill);
		until(salida!=0)
			
		/* Hacemos un fundido a negro */
			fade(0,0,0,30);
			while(fading)
				frame;
			end
		return i;
	OnExit
		signal(curs,s_kill);
		signal(type animacion,s_kill);
		delete_text(0);
		clear_screen();
	end
	
function selecperso(int veloc)
	private
		int i;
		int opc_coord[4][2];
	end
	begin
		for(i=0;i<4;i++)
			opc_coord[i][0]=(modo_x/2)-165;
			opc_coord[i][1]=65+(118*i);
		end
		file=fpgs[1];
		graph=100;
		z=20;
		i=0;
		
		repeat
			if(key(_menuabajo) || key(_abajopersonaje))				
				i++;
				if(i>veloc-1)
					i=0;
				end			
				while(key(_menuabajo) || key(_abajopersonaje))
					frame;
				end
			end
			if(key(_menuarriba) || key(_arribapersonaje))				
				i--;
				if(i<0)
					i=veloc-1;
				end			
				while(key(_menuarriba) || key(_arribapersonaje))
					frame;
				end
			end
			x=opc_coord[i][0];
			y=opc_coord[i][1];
			
			frame;
		until(key(_seleccionar) || key(_escape))
		while(key(_seleccionar)) frame; end
		if(key(_escape)) while(key(_escape)) frame; end return -1; end
		return i;
	end
	
function statsmenu(int k)
	private
		string texto;
		int chars,j,i,l=0;
		int ids[4];
	end
	begin
		chars=buscar("contar",3);
		for(id_obj=0;id_obj<chars;id_obj++)
			j=buscar("ingroup",3);
			if(j!=0)
				ids[l]=id_obj;
				log(j+" "+ids[l]);
				l++;
			end
		end
		id_obj=ids[k];
		menutype=6;
		log("Entrando en... menu de stats");
		
		file=fpgs[1];
		graph=4;
		
		x=modo_x/2;
		y=modo_y/2;
		z=18;
		
		texto=buscar("nombre_comp",12)+": "+buscar("nombre",3); write(fnts[1],(modo_x/2)-50,44,5,texto);
		texto=buscar("nivel",12)+": "+buscar("nivel",3)+"   Exp: xxxx/xxxx"; write(fnts[1],(modo_x/2)-50,88,5,texto);
		texto=buscar("pv_comp",12)+"("+buscar("pv",12)+"): "+buscar("pv",3)+"/"+buscar("pv_max",3); write(fnts[1],(modo_x/2)-50,132,5,texto);
		texto=buscar("iniciativa_comp",12)+": "+buscar("iniciativa",3); write(fnts[1],(modo_x/2)-50,176,5,texto);
		animacion(50,63,17,2,buscar("graph",3),4,4,0);
		
		repeat
			frame;
		until(key(_escape))
		while(key(_escape))frame;end
		delete_text(0);
	end
function skillsmenu()
	private
		int txt;
	end
	begin
		txt=write(fnts[1],100,500,3,"SkillsMenu");
		repeat
			frame;
		until(key(_escape))
		while(key(_escape))frame;end
		delete_text(txt);
	end