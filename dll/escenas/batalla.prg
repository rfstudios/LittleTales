/*
	Este archivo contiene las funciones generales del sistema de combates
*/

function iniciar_batalla() /* Esta función inicia el sistema */
	private
		int i,j;
		_lista* actual; /* Guarda el elemento en el que nos situamos */
		int cancion_actual; /* Canción que estaba sonando */
	end
	begin
		/* Congelamos todos los procesos */
			signal(type gameobject,s_freeze_tree);
			signal(personajeid,s_freeze_tree);

		/* Almacenamos la canción que sonaba y cambiamos */
			cancion_actual=sonando;
			sonando=-1;

		/* Hacemos un fundido a negro */
			fade(0,0,0,1);
			while(fading)
				frame;
			end
		/* Llamamos a los enemigos */
			i=100;		/* Coordenada x del enemigo */
			j=(modo_y/2)-50;	/* Coordenada y del enemigo */
			
			actual=enemigos; /* Recojemos el primer enemigo */
			while(actual != NULL)
				enemigo(actual.valor,i,j);	/* "Instanciamos" el enemigo							*/
				actual=actual.anterior;		/* Pasamos al siguiente enemigo							*/
				i+=200;						/* Pasamos a la siguiente "celda" del campo de batalla	*/
				if(i>1260) 					/* Si hemos terminado la fila							*/
					i-=1140; 				/* Volvemos al inicio de la fila						*/
					j-=100;					/* y nos vamos a la fila superior						*/
				end
			end
			
		/* Llamamos a los personajes */
			panel();
			
		/* Llamamos al gestor de turnos */
			reloj();
			
		/* Preparamos el entorno */
			x=modo_x/2;
			y=modo_y/2;
			z=99;
			file=fpgs[1];
			graph=200;

		/* Fundido desde negro */
			cambiar_tono_pantalla(0,0,0,0);
			fade(100,100,100,30);
			while(fading)
				frame;
			end
		/* Empieza la batalla*/	
			onoff=true;
			
		repeat 
			frame; 
		until(key(_enter));

		/* Termina la batalla*/	
			onoff=false;
			
		/* Hacemos un fundido a negro */
			fade(0,0,0,30);
			while(fading)
				frame;
			end

		/* Retomamos la canción */
			sonando=cancion_actual;

		/* Descargamos los elementos */
			descargar_pejotas();
			descargar_enemigos();
			signal(type reloj,s_kill);
			
		/* Fundido desde negro */
			cambiar_tono_pantalla(0,0,0,0);
			fade(100,100,100,30);
			while(fading)
				frame;
			end

		/* Levantamos los procesos */
			signal(type gameobject,s_wakeup_tree);
			signal(personajeid,s_wakeup_tree);
	end