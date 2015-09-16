/*
  En este archivo se especifican los archivos
  fuente del videojuego para incluirlos
*/

/*Declaraciones*/
	declare function string buscar(string cadena, int tipo) end

/*Sistema*/
	include "dll/funciones/globales.prg";
	include "dll/funciones/log.prg";
	include "dll/funciones/busqueda.prg";
	include "dll/funciones/configuracion.prg";
	include "dll/funciones/controles_ejecucion.prg";
	include "dll/funciones/animaciones.prg";
	include "dll/funciones/guardadatos.prg";
	include "dll/funciones/libfile.prg";
	
/*Acciones*/
	include "dll/acciones/grupo_1.prg";
	include "dll/acciones/grupo_2.prg";
	include "dll/acciones/grupo_3.prg";
	include "dll/acciones/grupo_4.prg";
	include "dll/acciones/grupo_5.prg";
	include "dll/acciones/grupo_6.prg";
	include "dll/acciones/grupo_7.prg";
	include "dll/acciones/grupo_8.prg";
	include "dll/acciones/grupo_9.prg";
	include "dll/acciones/grupo_10.prg";
	include "dll/acciones/grupo_11.prg";
	include "dll/acciones/grupo_12.prg";

/*Objetos*/
	include "dll/objetos/cursor.prg";
	include "dll/objetos/personaje.prg";
	include "dll/objetos/tile.prg";
	include "dll/objetos/gameobjects.prg";
	include "dll/objetos/evento.prg";
	include "dll/objetos/pantalla.prg";
	include "dll/objetos/musica.prg";

/*Batalla*/
	include "dll/batalla/enemigos.prg";
	include "dll/batalla/listas.prg";
	include "dll/batalla/pejotas.prg";
	include "dll/batalla/reloj.prg";
	
/*Escenas*/
	include "dll/escenas/presentacion.prg";
	include "dll/escenas/menu.prg";
	include "dll/escenas/juego.prg";
	include "dll/escenas/batalla.prg";
	
