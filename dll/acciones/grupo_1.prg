/*
	Acciones de evento de grupo 1
	limite 75
*/	
function mostrarmensaje(int textid)
	private
		string texto,aux;
		int contvuelta=0;
		int eof=false,nchar,salida;
		string linea1,linea2,linea3;
	end
	begin
		file=fpgs[0];
		x=modo_x/2;
		y=modo_y-82;
		z=1;
		graph=5;
		texto=buscar(textid,7);
		nchar=0;
		
		write_string(fnts[1],33,modo_y-132,3,&linea1);
		write_string(fnts[1],33,modo_y-88,3,&linea2);
		write_string(fnts[1],33,modo_y-37,3,&linea3);
		
		aux="";
		repeat
			linea1=linea2=linea3="";
			salida=false;
			contvuelta=nchar;
			
			for(linea1=aux;nchar<len(texto) && !salida;nchar++)
				for(aux="";nchar<len(texto) && texto[nchar]!=" ";nchar++)
					aux+=texto[nchar];
				end
				aux+=" ";
				
				if(nchar<contvuelta+75)
					linea1+=aux;
					aux="";
					frame;
				else
					salida=true;
				end
			end
			if(nchar>=len(texto) && salida==false)
				aux="";
			end
			salida=false;
			
			for(linea2=aux;nchar<len(texto) && !salida;nchar++)
				for(aux="";nchar<len(texto) && texto[nchar]!=" ";nchar++)
					aux+=texto[nchar];
				end
				aux+=" ";
				
				if(nchar<contvuelta+150)
					linea2+=aux;
					aux="";
					frame;
				else
					salida=true;
				end
			end
			if(nchar>=len(texto) && salida==false)
				aux="";
			end
			salida=false;
			
			
			for(linea3=aux;nchar<len(texto) && !salida;nchar++)
				for(aux="";nchar<len(texto) && texto[nchar]!=" ";nchar++)
					aux+=texto[nchar];
				end
				aux+=" ";
				
				if(nchar<contvuelta+224)
					linea3+=aux;
					aux="";
					frame;
				else
					salida=true;
				end
			end
			if(nchar>=len(texto) && salida==false)
				aux="";
			end
			
			while(key(_seleccionar)) frame; end
			repeat
				frame;
			until(key(_seleccionar))
			while(key(_seleccionar)) frame; end
		until(nchar>=len(texto))
	OnExit
		delete_text(0);
	end
	
function esperar(int frames)
	private
		int i;
	end
	begin
		for(i=0;i<frames;i++) frame; end
	end
	
function go_to(int file,int profundidad)
	begin
		switch(profundidad)
			case 0:
				/* Si llama el evento */
				father.file=file-1;
			end
			case 1:
				/* Si llama una acción */
				father.father.file=file-1;
			end
		end
		
	end
	
function elecciones(int textid,int si,int no,int respsi,int respno)
	private
		int curs;
	end
	begin
		mostrarmensaje(textid);
		
		file=fpgs[0];
		x=modo_x/2;
		y=modo_y-82;
		graph=5;
		
		write(fnts[1],33,modo_y-132,3,buscar(si,7));
		write(fnts[1],33,modo_y-88,3,buscar(no,7));
		
		curs=cursor();
		curs.x=150;
		curs.y=modo_y-132;
		
		repeat
			if(key(_menuarriba) || key(_menuabajo))
				if(curs.y==modo_y-132)
					curs.y=modo_y-88;
				else
					curs.y=modo_y-132;
				end				
				while(key(_menuarriba) || key(_menuabajo) || key(_arribapersonaje) || key(_abajopersonaje)) frame; end
			end
			frame;
		until(key(_seleccionar))
				
		if(curs.y==modo_y-132)
			if(respsi!=0)
				go_to(respsi,1);
			end
		else
			if(respno!=0)
				go_to(respno,1);
			end
		end
		signal(curs,s_kill);
		while(key(_seleccionar)) frame; end
	OnExit
		delete_text(0);
	end