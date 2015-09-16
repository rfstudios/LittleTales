/*
  Este archivo contiene las funciones de configuración
*/
function logging()
	begin
		if(fexists("ywn.ai"))
			glog=true;
			modo_ventana=1;
		else
			glog=false;
			modo_ventana=0;
		end
	end
	
function resolucion()
	private
		int escala;
	end
	begin
		escala=buscar("escala",0);
		scale_resolution=escala;
		
		if(modo_ventana!=0)
			set_mode(modo_x,modo_y,16,MODE_WINDOW);
		else
			set_mode(modo_x,modo_y,16,MODE_FULLSCREEN);
		end
		log("Resolución configurada en "+escala);
	end
	
function basededatos()
	begin
		db= SQLITE3_OPEN(filepath,2); /* Abre la base de datos */
		if(db)     
			log("Base de datos abierta correctamente..." );
		else
			log("Error al abrir la base de datos.");
		end
	end

function cargar_fpgs()
	private
		string ruta;
	end
	begin
		ruta=buscar("fpg_path",0);
		fpgs[0]=load_fpg(ruta+"common.fpg");
		fpgs[1]=load_fpg(ruta+"menus.fpg");
		fpgs[2]=load_fpg(ruta+"characters.fpg");
		fpgs[3]=load_fpg(ruta+"maps.fpg");
		fpgs[4]=load_fpg(ruta+"gameobjects.fpg");
		fpgs[5]=load_fpg(ruta+"animaciones.fpg");
		fpgs[6]=load_fpg(ruta+"enemigos.fpg");
		log("FPGs cargados en la ruta "+ruta);
	end

function cargar_fnts()
	private
		string ruta;
	end
	begin
		ruta=buscar("fnt_path",0);
		fnts[0]=load_fnt(ruta+"maintitle.fnt");
		fnts[1]=load_fnt(ruta+"ingame (tnr-40).fnt");
		fnts[2]=load_fnt(ruta+"ingame (tnr-30).fnt");
		log("FNTs cargados en la ruta "+ruta);
	end	

function cargar_snds()
	private
		string ruta;
	end
	begin
		ruta=buscar("snd_path",0);
		
		/*SoundFXs*/
			snds[0]=load_wav(ruta+"sndfx1.ogg");
		
		/*Canciones*/
			cancs[0]=load_song(ruta+"1.mp3");
			cancs[1]=load_song(ruta+"2.mp3");

		/*Canción de batalla*/
			cbatalla=load_song(ruta+"battle.mp3");
			
		log("Audio cargado en la ruta "+ruta);
	end
	
function cargar_lang()
	begin
		lang=buscar("lang",0);
		log("Lenguaje cargado "+lang);
	
	end
	
function cargar_controles()
	begin
		_menuizquierda=buscar("menuizquierda",1); log("_menuizquierda="+_menuizquierda);
		_menuderecha=buscar("menuderecha",1); log("_menuderecha="+_menuderecha);
		_menuarriba=buscar("menuarriba",1); log("_menuarriba="+_menuarriba);
		_menuabajo=buscar("menuabajo",1); log("_menuabajo="+_menuabajo);
		
		_izquierdapersonaje=buscar("izquierdapersonaje",1); log("_izquierdapersonaje="+_izquierdapersonaje);
		_derechapersonaje=buscar("derechapersonaje",1); log("_derechapersonaje="+_derechapersonaje);
		_arribapersonaje=buscar("arribapersonaje",1); log("_arribapersonaje="+_arribapersonaje);
		_abajopersonaje=buscar("abajopersonaje",1); log("_abajopersonaje="+_abajopersonaje);
		
		_alt_izquierdapersonaje=buscar("alt_izquierdapersonaje",1); log("_alt_izquierdapersonaje="+_alt_izquierdapersonaje);
		_alt_derechapersonaje=buscar("alt_derechapersonaje",1); log("_alt_derechapersonaje="+_alt_derechapersonaje);
		_alt_arribapersonaje=buscar("alt_arribapersonaje",1); log("_alt_arribapersonaje="+_alt_arribapersonaje);
		_alt_abajopersonaje=buscar("alt_abajopersonaje",1); log("_alt_abajopersonaje="+_alt_abajopersonaje);
		
		_seleccionar=buscar("seleccionar",1); log("_seleccionar="+_seleccionar);
		_escape=buscar("escape",1); log("_escape="+_escape);
	end
	
/*
  A partir de aquí están las funciones para guardar la configuración
*/

function guardar_lang(string lang)
	begin
		SQLITE3_EXEC(db,"UPDATE config SET valor='"+lang+"' WHERE palabraclave='lang'");
		log("Lenguaje guardado "+lang);
		cargar_lang();
		
	end

function guardar_escala(string escala)
	begin
		SQLITE3_EXEC(db,"UPDATE config SET valor='"+escala+"' WHERE palabraclave='escala'");
		log("Escala guardada "+escala);
		resolucion();
		
	end
