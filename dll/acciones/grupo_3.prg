/*
	Acciones de evento de grupo 3
*/	
function cambiar_dinero(int cant,int modo)
	private
		int dinero;
	end
	begin
		id_obj=0;
		dinero=buscar("dinero",3);
		switch(modo)
			case 0:
				dinero+=cant;
			end
			case 1:
				dinero-=cant;
			end
			case 2:
				dinero*=cant;
			end
			case 3:
				dinero/=cant;
			end
		end
		actualizar_personaje("dinero",dinero);
	end
	
function cambiar_objetos(int objeto,int cant,int operacion)
	private
		int cantidad;
	end
	begin
		cantidad=buscar(objeto,10);
		switch(operacion)
			case 0:
				if(cantidad>-1)
					cantidad+=cant;
					actualizar_inventario(objeto,cantidad);
				else
					insertar_inventario(objeto,cant);
				end
			end
			case 1:
				if(cantidad>-1)
					cantidad-=cant;
					actualizar_inventario(objeto,cantidad);
				else
					log("No se puede restar el objeto "+objeto);
				end
			end
			case 2:
				if(cantidad>-1)
					cantidad*=cant;
					actualizar_inventario(objeto,cantidad);
				else
					log("No se puede multiplicar el objeto "+objeto);
				end
			end
			case 3:
				if(cantidad>-1)
					cantidad/=cant;
					actualizar_inventario(objeto,cantidad);
				else
					log("No se puede dividir el objeto "+objeto);					
				end
			end
		end
	end
	
/* Más adelante */
function cambiar_grupo()
	begin
	
	end