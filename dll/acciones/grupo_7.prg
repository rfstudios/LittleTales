/*
	Acciones de evento de grupo 7
*/	
function mostrar_imagen(int x,int y,int z,int file,int grafico,int anim)
	begin
		imagen(x,y,z,file,grafico,anim);
	end
	
function mover_imagen()
	begin
	
	end
	
function rotar_imagen()
	begin
	
	end
	
function cambiar_tono_imagen()
	begin
	
	end
	
function borrar_imagen()
	begin
		signal(type imagen,s_kill);
	end
	
function mostrar_animacion(int id_obj, int file, int inic, int frames)
	begin
		if(id_obj>0)
			animacion(father.father.x,father.father.y,father.father.z-1,file,inic,frames,1,1);
		else
			animacion(xper,yper,0,file,inic,frames,1,1);
		end
	end