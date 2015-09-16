/*
  En este archivo se especifican las "tuplas", las
  constantes y las variables globales
*/

/* Tupla que define un elemento de una lista din�mica */
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
		int _menuizquierda, _menuderecha, _menuarriba, _menuabajo; 										/* Men� 				 */
		int _izquierdapersonaje, _derechapersonaje, _arribapersonaje, _abajopersonaje;					/* Personaje 			 */
		int _alt_izquierdapersonaje, _alt_derechapersonaje, _alt_arribapersonaje, _alt_abajopersonaje;	/* Personaje alternativo */
		int _seleccionar, _escape;																		/* General 				 */
	
	/*Control de ejecuci�n */
		int ganimacion, bloq=false,animacion; /* Si est� en true se bloquean los controles 			  	*/
		int mapid,tono[4]=(0,0,0,0);		  /* ID del mapa y tono de la pantalla					  	*/
		int flash=0;
		int camara;							  /* ID del evento a quien asignar la c�mara: 0 = personaje */
		int xper, yper,oper,flagper;		  /* "x", "y", orientaci�n y flags del personaje			*/
		int personajeid;					  /* ID del proceso de pintado del perosnaje				*/
		int graph_general,graph_dur;		  /* Gr�fico del mapa y dureza del mapa					  	*/
		int global_i,scroll_graph,desv_x=0;	  /* Variable i global y gr�fico del scroll				  	*/
		int sonando=-2,volumen=100;			  /* Id de la canci�n que est� sonando					  	*/

	/* Motor de combate */
		_lista* pejotas;
		_lista* enemigos;
		_lista* turno;
		
		bool onoff=false;			 /* Indica si la batalla ha empezado o no 							    */
		bool caballito_blanco=false; /* Indica a todos los procesos de la batalla que se esperen un momento */
		
		int tablon[5];	/*[0] id del que tiene el turno
						  [1] 1 cuando al que le toca el turno ha terminado
						  [2] id a qui�n targetea
						  [3] n� de habilidad
						  [4] par�metro auxiliar
						*/
end 
local
	int menutype; /* Si es un men� esta variable contendr� un valor de 1 en adelante */
	int mirada,anim_cont,veloc; /* Contienen la orientaci�n, un contador para la animaci�n y la velocidad */
	int id_obj; /* Identificador de objeto */
	int grafico,frames,orientaciones; /* Identificador del gr�fico del gameobject o personaje, n�mero de frames
									     de su animaci�n y n�mero de orientaciones del gr�fico */
end
