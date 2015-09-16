/*
  Este archivo contiene el personaje
*/

process personaje()
	private
		int graf_orig;
	end
	begin
		id_obj=0;
		
		grafico=buscar("graph",3);
		ctype=1;
		z=-1;
		frames=4;
		orientaciones=4;
		veloc=4;
		loop
			if(camara==0)
				scroll[0].camera=id;
			end
			
			x=xper;
			y=yper;
			z=map_info(fpgs[3],mapid,1)-yper+5;
			mirada=oper;
			flags=flagper;
			
			if(grafico>0)
				char_calc(2,grafico,mirada,anim_cont,frames,orientaciones);
				center_set(0,graph,map_info(0,graph,G_WIDTH)/2,map_info(0,graph,G_HEIGHT));	
			end
			
			frame;
		end
	end