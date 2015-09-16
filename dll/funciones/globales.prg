/*
  En este archivo se especifican las "tuplas", las
  constantes y las variables globales
*/

/* Tupla que define un elemento de una lista dinámica */
	type _lista
		int valor; /* Valor */
		_lista* anterior; /* Elemento anterior */
	end

const
	modo_x=1280;
	modo_y=720;
end
global 
	int modo_ventana=1;
	/* Control global de los logs */
		int glog=false;
		int pf;
		
	/* Base de datos */
		res,db;   
		filepath="rpg.yawdb";
		TSqlResult sqlRes;
	
	/* Recursos */
		int fpgs[7],fnts[3],snds[2],cancs[2],cbatalla;
		string lang="es_ES";
	
	/* Controles */
		int _menuizquierda, _menuderecha, _menuarriba, _menuabajo; 										/* Menú 				 */
		int _izquierdapersonaje, _derechapersonaje, _arribapersonaje, _abajopersonaje;					/* Personaje 			 */
		int _alt_izquierdapersonaje, _alt_derechapersonaje, _alt_arribapersonaje, _alt_abajopersonaje;	/* Personaje alternativo */
		int _seleccionar, _escape;																		/* General 				 */
	
	/*Control de ejecución */
		int ganimacion, bloq=false,animacion; /* Si está en true se bloquean los controles 			  	*/
		int mapid,tono[4]=(0,0,0,0);		  /* ID del mapa y tono de la pantalla					  	*/
		int flash=0;
		int camara;							  /* ID del evento a quien asignar la cámara: 0 = personaje */
		int xper, yper,oper,flagper;		  /* "x", "y", orientación y flags del personaje			*/
		int personajeid;					  /* ID del proceso de pintado del perosnaje				*/
		int graph_general,graph_dur;		  /* Gráfico del mapa y dureza del mapa					  	*/
		int global_i,scroll_graph,desv_x=0;	  /* Variable i global y gráfico del scroll				  	*/
		int sonando=-2,volumen=100;			  /* Id de la canción que está sonando					  	*/

	/* Motor de combate */
		_lista* pejotas;
		_lista* enemigos;
		_lista* turno;
		
		bool onoff=false;			 /* Indica si la batalla ha empezado o no 							    */
		bool caballito_blanco=false; /* Indica a todos los procesos de la batalla que se esperen un momento */
		
		int tablon[5];	/*[0] id del que tiene el turno
						  [1] 1 cuando al que le toca el turno ha terminado
						  [2] id a quién targetea
						  [3] nº de habilidad
						  [4] parámetro auxiliar
						*/
end 
local
	int menutype; /* Si es un menú esta variable contendrá un valor de 1 en adelante */
	int mirada,anim_cont,veloc; /* Contienen la orientación, un contador para la animación y la velocidad */
	int id_obj; /* Identificador de objeto */
	int grafico,frames,orientaciones; /* Identificador del gráfico del gameobject o personaje, número de frames
									     de su animación y número de orientaciones del gráfico */
end
