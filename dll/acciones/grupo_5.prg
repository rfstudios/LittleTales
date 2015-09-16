/*
	Acciones de evento de grupo 5
*/	
function teletransportar(int x,int y,int z,int mapa)
	begin
		xper=x;
		yper=y;
		oper=z;
		mapid=mapa;
	end
function cambiar_pos_evento(int x,int y,int mirada,int def)
	begin
		if(x<0)
			x=father.father.x;
		end
		if(y<0)
			y=father.father.y;
		end
		if(mirada<0)
			mirada=father.father.mirada;
		end
		
		father.father.x=x;
		father.father.y=y;
		father.father.mirada=mirada;
		
		/* ¿Es definitivo?*/
		if(def)
			actualizar_gameobject("x",x,father.father.id_obj);
			actualizar_gameobject("y",y,father.father.id_obj);
			actualizar_gameobject("o",mirada,father.father.id_obj);
		end
	end
	
function cambiar_grafico_mapa(int grafico)
	begin
		start_scroll(0,fpgs[3],grafico,0,0,0,0,scroll_graph);
		graph_dur=buscar("graph_dur",4);
		graph_general=grafico;
	end
	
/* ¿? Investigar */
function cambiar_tono_niebla()
	begin
	
	end
	
function cambiar_transparencia(int even,int flags,int def)
	begin
		if(flags>0)
			flags=4;
		else
			flags=0;
		end
		
		if(!even)
			flagper=flags;
			
			/* ¿Es definitivo?*/
			if(def)
				actualizar_personaje("flags",flags);
			end
		else
			father.father.flags=flags;
			
			/* ¿Es definitivo?*/
			if(def)
				actualizar_gameobject("flags",father.father.flags,father.father.id_obj);
			end
		end
	end
	
function mover_personaje(int direc,int vuel)
	private
		int cont,i,j;
	end
	begin
		for(j=0;j<vuel;j++)
			if(j>1) frame; end
			switch(direc)
				case 0: /* Arriba */
					oper=2;
					if(global_i>personajeid.veloc)
						personajeid.anim_cont++;
						if(personajeid.anim_cont>3)
							personajeid.anim_cont=0;
						end
						global_i=0;
					else
						global_i++;
					end
					for(cont=0;cont<personajeid.veloc;cont++)
						if(map_get_pixel(fpgs[3],graph_dur,xper,yper-20)!=rgb(255,255,255) && map_get_pixel(fpgs[3],graph_dur,xper,yper-20)!=rgb(255,0,0) && yper-20>20)
							yper--;
						end
					end
				end
				case 1: /* Abajo */
					oper=0;
					if(global_i>personajeid.veloc)
						personajeid.anim_cont++;
						if(personajeid.anim_cont>3)
							personajeid.anim_cont=0;
						end
						global_i=0;
					else
						global_i++;
					end
					for(cont=0;cont<personajeid.veloc;cont++)
						if(map_get_pixel(fpgs[3],graph_dur,xper,yper)!=rgb(255,255,255) && yper<map_info(fpgs[3],graph_general,1)+10)
							yper++;
						end
					end
				end
				case 2: /* Izquierda */
					oper=1;
					if(global_i>personajeid.veloc)
						personajeid.anim_cont++;
						if(personajeid.anim_cont>3)
							personajeid.anim_cont=0;
						end
						global_i=0;
					else
						global_i++;
					end
					for(cont=0;cont<personajeid.veloc;cont++)
						if(map_get_pixel(fpgs[3],graph_dur,xper-20,yper-19)!=rgb(255,255,255) && map_get_pixel(fpgs[3],graph_dur,xper,yper-19)!=rgb(0,255,0) && xper-10>0)
							xper--;
						end
					end
				end
				case 3:
					oper=3;
					if(global_i>personajeid.veloc)
						personajeid.anim_cont++;
						if(personajeid.anim_cont>3)
							personajeid.anim_cont=0;
						end
						global_i=0;
					else
						global_i++;
					end
					for(cont=0;cont<personajeid.veloc;cont++)
						if(map_get_pixel(fpgs[3],graph_dur,xper+20,yper-19)!=rgb(255,255,255) && map_get_pixel(fpgs[3],graph_dur,xper,yper-19)!=rgb(0,0,255) && xper+10<map_info(fpgs[3],graph_general,0))
							xper++;
						end
					end
				end
			end
		end
	end
	
function asignar_camara(int id_obj)
	begin
		camara=id_obj;
	end
