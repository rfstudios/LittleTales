process actualizar_personaje(string columna,int valor)
	begin
		SQLITE3_EXEC(db,"UPDATE characters SET "+columna+"="+valor+" WHERE id="+father.id_obj);
		log("Dato "+columna+" guardado");
	end
	
process actualizar_inventario(int objeto,int cantidad)
	begin
		SQLITE3_EXEC(db,"UPDATE inventario SET cantidad="+cantidad+" WHERE id_obj="+objeto);
		log("Objeto "+objeto+": guardada cantidad "+cantidad);
	end	
process insertar_inventario(int objeto,int cantidad)
	begin
		SQLITE3_EXEC(db,"INSERT INTO inventario (id_obj,cantidad) VALUES ("+objeto+","+cantidad+")");
		log("Objeto "+objeto+" insertado");
	end
	
process actualizar_gameobject(string columna,int valor,int objeto)
	begin
		SQLITE3_EXEC(db,"UPDATE gameobjects SET "+columna+"="+valor+" WHERE id="+objeto+" and id_map="+mapid);
		log("Dato "+columna+" guardado");
	end		
	
process actualizar_mapa(string columna,int valor)
	begin
		SQLITE3_EXEC(db,"UPDATE maps SET "+columna+"="+valor+" WHERE id="+mapid);
		log("Dato "+columna+" guardado");
	end	
process actualizar_partida(string objeto,int valor)
	private
		int hay;
	end
	begin
		hay=buscar(objeto,11);
		if(hay>-1)
			SQLITE3_EXEC(db,"UPDATE datos_partida SET valor="+valor+" WHERE nombre='"+objeto+"'");
			log("Dato "+objeto+" guardado");
		else
			SQLITE3_EXEC(db,"INSERT INTO datos_partida (valor,nombre) VALUES ("+valor+",'"+objeto+"')");
			log("Dato "+objeto+" insertado");
		end
		
	end