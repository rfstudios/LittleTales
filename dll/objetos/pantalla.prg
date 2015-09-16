process tono_pantalla()
	private
		int tono_pant[4];
		int i,j;
	end
	begin
		x=modo_x/2;
		y=modo_y/2;
		flags=4;
		z=0;
		loop
			tono_pant[0]=tono[0];
			tono_pant[1]=tono[1];
			tono_pant[2]=tono[2];
			tono_pant[3]=tono[3];

			grafico=new_map(modo_x,modo_y,16);
			
			if(tono[3]>0)
				map_clear(0,grafico,rgb(tono[0],tono[1],tono[2]));
			else
				grafico=0;
			end
			graph=grafico;

			repeat
				if(flash)
					grafico=new_map(modo_x,modo_y,16);
					map_clear(0,grafico,rgb(255,255,255));
					graph=grafico;
					flags=0;

					flash=false;
					frame;

					flags=4;
					if(tono[3]>0)
						map_clear(0,grafico,rgb(tono[0],tono[1],tono[2]));
					else
						grafico=0;
					end
					graph=grafico;
				end
				frame;
			until(tono_pant[0]!=tono[0] || tono_pant[1]!=tono[1] || tono_pant[2]!=tono[2] || tono_pant[3]!=tono[3])
		end
	end
	
process pantalla()
	begin
		x=modo_x/2;
		y=modo_y/2;
		z=100;
		graph=scroll_graph;
		
		loop
		x=(modo_x/2)+desv_x;
			frame;
		end
	end
	
process imagen(int x,int y,int z,int fil,int grafico,int frames)
	private
		int i=0;
	end
	begin
		file=fpgs[fil];
		z=1;
		graph=grafico;
		loop
			if(frames>1)
				for(i=0;i<frames;i++)
					graph=grafico+i;
					frame;
				end
			end
			frame;
		end
	end
	
process animacion(int x, int y, int z,int file,int grafico,int frames,int orientaciones,int ctype)
	private
		int i;
	end
	begin
		switch(ctype)
			case 0:
				veloc=750;
			end
			case 1:
				veloc=100;
			end
		end
		repeat
			for(anim_cont=0;anim_cont<frames;anim_cont++)	
				char_calc(file,grafico,0,anim_cont,frames,orientaciones);
				frame(veloc);
			end
			
			if(!exists(type ingmenu)) ctype=1; end
		until(ctype!=0)
	end