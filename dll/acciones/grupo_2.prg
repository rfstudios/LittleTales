/*
	Acciones de evento de grupo 2
*/
function borrar_evento()
	begin
		go_to(-1,1);
		father.father.id_obj=-1;
	end
	
function pasar_pagina() 
	private
		int prox_event;
	end
	begin
		prox_event=buscar(father.id_obj,8);
		SQLITE3_EXEC(db,"UPDATE gameobjects SET event_id="+prox_event+" WHERE id="+father.father.id_obj+" and id_map="+mapid);
		log("Dato event_id="+prox_event+" guardado en el gameobject "+father.father.id_obj);
		
		go_to(-1,1);
	end
	
function atras_pagina() 
	private
		int prox_event;
	end
	begin
		prox_event=buscar(father.id_obj,9);
		SQLITE3_EXEC(db,"UPDATE gameobjects SET event_id="+prox_event+" WHERE id="+father.father.id_obj);
		log("Dato event_id="+prox_event+" guardado en el gameobject "+father.father.id_obj);
		
		go_to(-1,1);
	end