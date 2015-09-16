/*
	Acciones de evento de grupo 8
*/	
function cambiar_musica(int cancion)
	begin
		sonando=cancion;
	end

function volumen_musica(int volumen)
	begin
		set_song_volume(volumen);
	end
	
function reproducir_sonido(int sonido)
	begin
		Play_wav(snds[sonido],0);
		log("Ejecutando sonido "+sonido);
	end
	
function guardar_musica()
	begin
		actualizar_mapa("song",sonando);
	end