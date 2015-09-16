/*
	Este fichero contiene el gestor de turnos, llamado "Reloj"
*/

process reloj()
	private
		int i;
	end
	begin
		tablon[0]=tablon[1]=tablon[2]=tablon[3]=tablon[4]=0; /* Inicializamos el tablón de anuncios */
		repeat frame; until(onoff!=false) 					 /* Esperamos a que empiece la batalla */
		
		/* Comienza la batalla */
			repeat
				/* Debido a que sólo refrescamos los turnos si tenemos apuntado que el último turno ha terminado */
					if(tablon[0]==0) /* Comprobamos si el turno anterior era de alguien */
						tablon[1]=1; /* De no ser así, activamos el refresco para comprobar 
										si ya hay alguien a quien le toque el turno*/
					end
				
				/* Si el turno anterior ha terminado*/
					if(tablon[1]==1)
						tablon[1]=tablon[2]=tablon[3]=tablon[4]=0; /* Refrescamos el tablón de anuncios*/
						tablon[0]=pasar_turno(); /* Pasamos el turno al siguiente */
					end
				frame;
			until(onoff!=true) /* Esperamos a que termine la batalla */
	end