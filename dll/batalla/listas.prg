/*
	Este fichero contiene funciones para cargar y descargar las listas
	as� como funciones para buscar contenidos en ellas.
*/

/*********************/
/* LISTA DE ENEMIGOS */

function cargar_enemigo(int id_obj) /* Esta funci�n carga un enemigo en el sistema */
	private
		_lista* nuevo; /* Guarda el puntero al nuevo elemento que vamos a a�adir */
	end
	begin
		nuevo=alloc(sizeof(_lista));/* Reservo la memoria											*/
		nuevo.valor=id_obj;	 		/* Asigno el tipo de enemigo que es 							*/
		nuevo.anterior=enemigos; 	/* Asigno el puntero para que apunte al �ltimo elemento a�adido */
		enemigos=nuevo;		 		/* Reasigno el puntero global para que apunte al nuevo 	 		*/
		log("Cargado enemigo["+enemigos.valor+"] a la batalla");
	end

function descargar_enemigos() /* Esta funci�n descarga la lista de enemigos */
	private
		int i;
		_lista* actual; /* Guarda el elemento en el que nos situamos */
	end
	begin
		while(enemigos != NULL)
			actual=enemigos; 			/* Recojemos el primer enemigo	*/
			free(enemigos);				/* Liberamos el enemigo			*/
			enemigos=actual.anterior;	/* Pasamos al siguiente enemigo	*/
		end
	end

/***********************/
/* LISTA DE PERSONAJES */	

function cargar_pejota(int id_obj) /* Esta funci�n a�ade un elemento a la lista de personajes en batalla */
	private
		_lista* nuevo; /* Guarda el puntero al nuevo elemento que vamos a a�adir */
	end
	begin
		nuevo=alloc(sizeof(_lista));/* Reservo la memoria											*/
		nuevo.valor=id_obj;	 		/* Asigno el id del proceso del pejota 							*/
		nuevo.anterior=pejotas; 	/* Asigno el puntero para que apunte al �ltimo elemento a�adido */
		pejotas=nuevo;		 		/* Reasigno el puntero global para que apunte al nuevo 	 		*/
		log("Cargado personaje["+pejotas.valor+"] a la batalla");
	end	
function descargar_pejotas() /* Esta funci�n descarga la lista de personajes en batalla */
	private
		int i;
		_lista* actual; /* Guarda el elemento en el que nos situamos */
	end
	begin
		while(pejotas != NULL)
			actual=pejotas; 			/* Recojemos el primer pejota	*/
			free(pejotas);				/* Liberamos el pejota			*/
			pejotas=actual.anterior;	/* Pasamos al siguiente pejota	*/
		end
	end
	
/*******************/
/* LISTA DE TURNOS */


function cargar_turno(int id_obj) /* Esta funci�n a�ade un elemento a la lista de espera de turno */
	private
		_lista* nuevo; /* Guarda el puntero al nuevo elemento que vamos a a�adir */
	end
	begin
		nuevo=alloc(sizeof(_lista));/* Reservo la memoria											*/
		nuevo.valor=id_obj;	 		/* Asigno el id del combatiente									*/
		nuevo.anterior=turno; 	/* Asigno el puntero para que apunte al �ltimo elemento a�adido */
		turno=nuevo;		 		/* Reasigno el puntero global para que apunte al nuevo 	 		*/
		
		log("Turno cargado para "+id_obj);
	end	
function descargar_turno() /* Esta funci�n descarga la lista de turnos */
	private
		int i;
		_lista* actual; /* Guarda el elemento en el que nos situamos */
	end
	begin
		while(pejotas != NULL)
			actual=turno; 			/* Recojemos el primer turno	*/
			free(turno);				/* Liberamos el turno		*/
			turno=actual.anterior;	/* Pasamos al siguiente turno	*/
		end
	end
function pasar_turno() /* Esta funci�n para el turno al siguiente elemento eliminando el actual de la lista */
	private
		int siguiente;
		_lista *proximo,*le_toca_a; /* Guarda el elemento en el que nos situamos */
	end
	begin
		caballito_blanco=true; /* Detenemos la acci�n*/
		
		if(turno!=NULL) /* Si tenemos a alguien esperando turno */
			log("El turno lo tenia "+tablon[0]);
			le_toca_a=turno; /* Le apuntamos */
			
			while(le_toca_a.anterior!=NULL) /* Miramos si es el �ltimo de la fila						*/
				proximo=le_toca_a;			/* Si no es el �ltimo de la fila lo apuntamos con "proximo" */
				le_toca_a=proximo.anterior; /* Y apuntamos a "le_toca_a" al siguiente					*/
			end
			if(proximo!=NULL) 			/* Puede darse el caso que s�lo hubiera uno esperando 												   */
				proximo.anterior=NULL;	/* De no ser as�, al que a partir de ahora ser� el �ltimo de la lista, le decimos que no hay nadie m�s */
			else
				turno=NULL;
			end
			
			siguiente=le_toca_a.valor;	/* Guardamos la id del afortunado al que le ha tocado */
			free(le_toca_a);			/* Y liberamos la memoria donde est� dicho afortunado */
			
			log("Ahora lo tiene "+siguiente);
		else
			siguiente=0;
		end
		
		caballito_blanco=false; /* Reanudamos la acci�n */
		return siguiente;
	end