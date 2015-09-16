/*
   Este archivo contiene el proceso gameobject
*/

process gameobject(int id_obj)
	private
		int iy=0,event,eventype,event_id,inter=false;
		int animado, posic;
	end
	begin
		ctype=1;
		grafico=buscar("graph",5);
		frames=buscar("frames",5);
		orientaciones=buscar("orientaciones",5);
		
		if(grafico>0)
			char_calc(4,grafico,0,0,frames,orientaciones);
			center_set(0,graph,map_info(0,graph,G_WIDTH)/2,map_info(0,graph,G_HEIGHT));	
		end
		anim_cont=0;
		veloc=4;
		
		x=buscar("x",5);
		y=buscar("y",5);
		flags=buscar("flags",5);
		mirada=buscar("o",5);
		animado=buscar("animado",5);
		posic=buscar("posic",5);
		
		/* EVENTYPE
			1 - Evento de Inicio automático
			2 - Evento de ejecución paralela
			3 - Evento de ejecución al colisionar
			4 - Evento de ejecución al colisionar y pulsar aceptar
		*/
		event=buscar("event_id",5);
		eventype=buscar("tipo",6);
		
		repeat
			/* Recogemos nuevamente los datos, por si han cambiado */
			if(eventype!=0)
				event=buscar("event_id",5);
				eventype=buscar("tipo",6);
			end
				
			if(posic==0) z=map_info(fpgs[3],mapid,1)-y;
			elsif(posic==1) z=100000;
			else z=-1; end
			
			switch(eventype)
				case 1:
					if(!inter)
						evento(event,true);
						inter=true;
						bloq=true;
					end
				end
				case 2:
					if(!inter)
						evento(event,false);
						inter=true;
					end
				end
				case 3:						
					if(collision(personajeid) && get_dist(personajeid)<20 && !exists(event_id))
						event_id=evento(event,true);
					end				
				end
				case 4:						
					if(collision(personajeid) && get_dist(personajeid)<35 && !exists(event_id))
						if(key(_seleccionar))
							event_id=evento(event,true);
							while(key(_seleccionar)) frame; end
						end
					end		
				end
			end
			
			if(frames>1 && grafico>0 && animado==1)
				if(iy>veloc)
					anim_cont++;
					if(anim_cont>frames-1)
						anim_cont=0;
					end
					
					char_calc(4,grafico,mirada,anim_cont,frames,orientaciones);
					center_set(0,graph,map_info(0,graph,G_WIDTH)/2,map_info(0,graph,G_HEIGHT));	
					iy=0;
				else
					iy++;
				end
			end
			frame;
		until(id_obj==-1)
		signal(event_id,s_kill_tree);
	end