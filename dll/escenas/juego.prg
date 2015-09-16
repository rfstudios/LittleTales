/*
  Este archivo contiene el juego (en lineas generales)

  Notas:
	En el parámetro de cámara (en la bd) lo que se pone 
	Es el identificador de evento. 0 es el personaje.   
*/

function juego()
	private
		int mapa,i,j;
	end
	begin
		log("Entrando en... juego");
		
		/* Inicializamos el scroll */
			scroll_graph=new_map(1280,720,16);
			start_scroll(0,0,0,0,0,0,0,scroll_graph);
			pantalla();
			
		/* Creamos los tiles */
			/*for(i=50;i<1330;i+=50)
				for(j=50;j<760;j+=50)
					tile(i,j);
				end
			end*/
		
		/* Cargamos la partida */
			cargar();

		repeat
			/* Bloqueamos los controles */
				ganimacion=true;
				
			/* Recojemos el mapa a cargar y creamos su scroll */
				mapa=mapid;
				cambiar_grafico_mapa(buscar("graph",4));
				
			/* Cambiamos la canción */
				sonando=buscar("song",4);
				
			/* Creamos los gameobjects */
				j=buscar("contar",5);
				for(i=0;i<j;i++)
					gameobject(i+1);
				end
			
			/* Creamos el personaje */
				personajeid=personaje();
			
			/* Asignamos la cámara y desbloqueamos los controles */
				camara=buscar("camera",4);
				if(!bloq) ganimacion=false;	end
			
			log("Entrando en... #"+mapa);
			fade_on();
			repeat
				frame;
			until(mapid!=mapa)
			log("Saliendo de... #"+mapa);
			
			/* Congelamos los procesos, para fundir en negro sin
			que desaparezcan*/
				signal(type gameobject,s_freeze_tree);
				signal(personajeid,s_freeze_tree);
			
			/* Hacemos un fundido a negro */
				fade(0,0,0,30);
				while(fading)
					frame;
				end
			
			/* Bloqueamos los controles */
				ganimacion=true;
			
			/* Matamos los procesos abiertos */
				signal(type gameobject,s_kill_tree);
				signal(personajeid,s_kill_tree);
				
			/* Paramos el scroll */
				stop_scroll(0);
				
			/* Borramos cualquier texto que pueda quedar escrito */
				delete_text(0);
				
			/* Actualizamos los datos del personaje */
				guardar();
			
		until(mapid==0)
		signal(type pantalla,s_kill_tree);
		signal(type imagen,s_kill);
	end