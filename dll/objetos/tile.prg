/*
   Este archivo contiene el sistema de tiles
*/

process tile(int eq, int iy)
	private
		int i,j,graf,mapa;
		int temp_x=123,temp_y=123;
	end
	begin
		ctype=1;
		graph=map_new(100,100,16);
		
		mapa=mapid;
		graf=buscar("graph",4);
		loop
			if(temp_x!=scroll[0].x0 || temp_y!=scroll[0].y0)
				temp_x=scroll[0].x0;
				temp_y=scroll[0].y0;
				x=scroll[0].x0+eq;
				y=scroll[0].y0+iy;
				
				for(i=-50;i<50;i++)
					for(j=-50;j<50;j++)
						map_put_pixel(0,graph,i,j,map_get_pixel(fpgs[3],graf,x+i,y+j));
					end
				end
			end
			if(mapa!=mapid)
				mapa=mapid;
				graf=buscar("graph",4);
			end
			frame;
		end
	end