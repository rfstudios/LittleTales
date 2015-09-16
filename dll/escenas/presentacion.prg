/*
  Este archivo contiene las splashscreens
*/

function presentacion()
	public
		int i,j,iy,eq,aux;
	end
	begin		
		log("Entrando en... presentacion");
		
		if(modo_ventana!=0)
			set_mode(640,480,32,MODE_WINDOW);
		else
			set_mode(640,480,32,MODE_FULLSCREEN);
		end
		
		fade(0,0,0,100);
		while(fading)
			frame;
		end
		screen_put(fpgs[0],1);
		fade(100,100,100,1);
		while(fading)
			frame;
		end
		for(i=0;i<120;i++)
			frame;
		end
		fade(0,0,0,1);
		while(fading)
			frame;
		end
		clear_screen();
		fade(100,100,100,64);
		
		eq=100;
		iy=195;
		
		set_fps(120,1);
		ganimacion=true;
		for(i=0;i<81;i++)
			for(j=0;j<487;j++)
				if(map_get_pixel(fpgs[0],2,j,i)==map_get_pixel(fpgs[0],3,0,0))
					switch(rand(1,4))
						case 1:
							aux=rand(0,480);
							punto(-1,aux,eq,iy);
						end
						case 2:
							aux=rand(0,640);
							punto(aux,-1,eq,iy);
						end
						case 3:
							aux=rand(0,480);
							punto(641,aux,eq,iy);
						end
						case 4:
							aux=rand(0,640);
							punto(aux,481,eq,iy);
						end
					end
				end
				eq++;
			end
			eq=100;
			iy++;
		end
		for(i=0;i<200;i++)
			frame;
		end
		ganimacion=false;
		set_fps(60,1);
		while(exists(type punto))
			frame;
		end
		log("Saliendo de... presentacion");
	end
	
process punto(int x, int y, int eq, int iy)
	private
		int aux,i;
		int vel=1;
	end
	begin
		graph=new_map(1,1,32);
		map_put_pixel(0,graph,0,0,rgb(255,165,0));
		vel=rand(1,3);

		repeat
			if(x<eq)
				x++;
			end
			if(eq<x)
				x--;
			end
			if(y<iy)
				y++;
			end
			if(iy<y)
				y--;
			end
			
			frame;
			
			for(i=0;i<rand(1,3)+vel;i++)
				if(x<eq)
					x++;
				end
				if(eq<x)
					x--;
				end
			end
			for(i=0;i<rand(0,3);i++)
				if(y<iy)
					y++;
				end
				if(iy<y)
					y--;
				end
			end
		until(ganimacion!=true)
	end 