/*
	Acciones de evento de grupo 4
*/	
function guardar()
	begin
		actualizar_personaje("xper",xper);
		actualizar_personaje("yper",yper);
		actualizar_personaje("oper",oper);
		if(mapid!=0) actualizar_personaje("mapa",mapid); end
		
		actualizar_partida("tono0",tono[0]);
		actualizar_partida("tono1",tono[1]);
		actualizar_partida("tono2",tono[2]);
		actualizar_partida("tono3",tono[3]);
	end
	
function cargar()
	begin
		xper=buscar("xper",3);
		yper=buscar("yper",3);
		oper=buscar("oper",3);
		flagper=buscar("flags",3);
		mapid=buscar("mapa",3);

		tono[0]=buscar("tono0",11);
		tono[1]=buscar("tono1",11);
		tono[2]=buscar("tono2",11);
		tono[3]=buscar("tono3",11);
		
		log("Partida cargada correctamente.");
	end