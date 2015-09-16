/*
  Este archivo contiene el proceso que controla la ejecución
*/
process control()
	private
		int cont,i;
	end
	begin
		loop
			if(key(_escape))
				if(mapid>0)
					llamar_mainmenu();
					while(key(_escape)) frame; end
				else
					if(exists(type optionmenu))
						while(key(_escape)) frame; end
						signal(type optionmenu,s_kill_tree);
					else
						let_me_alone();
						exit(0);
					end
				end
			end
			
			if(ganimacion!=true && exists(personajeid))
				if(glog)
					if(key(_F1))
						teletransportar(200,250,oper,1);
						while(key(_F1)) frame; end
					end
					if(key(_F2))
						teletransportar(300,450,oper,2);
						while(key(_F2)) frame; end
					end
					if(key(_F3))
						sacudir_pantalla(60);
						while(key(_F3)) frame; end
					end
					if(key(_F4))
						volumen_musica(10);
						while(key(_F4)) frame; end
					end
					if(key(_F5))
						volumen_musica(100);					
						while(key(_F5)) frame; end
					end
					if(key(_F6))
						llamar_menu();					
						while(key(_F6)) frame; end
					end
					if(key(_F7))
						game_over();					
						while(key(_F7)) frame; end
					end
					if(key(_F8))
						cargar_enemigo(rand(1,2));
						while(key(_F8)) frame; end
					end
					if(key(_F9))
						iniciar_batalla();
						while(key(_F9)) frame; end
					end
					if(key(_F12))
						log("X="+xper+", Y="+yper+", O="+oper);
						while(key(_F12)) frame; end
					end
				end
				
				if(key(_arribapersonaje) || key(_alt_arribapersonaje) && !key(_abajopersonaje) && !key(_alt_abajopersonaje))
					mover_personaje(0,1);
				elsif(key(_abajopersonaje) || key(_alt_abajopersonaje) && !key(_arribapersonaje) && !key(_alt_arribapersonaje))
					mover_personaje(1,1);
				elsif(key(_izquierdapersonaje) || key(_alt_izquierdapersonaje) && !key(_arribapersonaje) && !key(_abajopersonaje) && !key(_derechapersonaje) && !key(_alt_arribapersonaje) && !key(_alt_abajopersonaje) && !key(_alt_derechapersonaje))
					mover_personaje(2,1);
				elsif(key(_derechapersonaje) || key(_alt_derechapersonaje) && !key(_arribapersonaje) && !key(_abajopersonaje) && !key(_izquierdapersonaje) && !key(_alt_arribapersonaje) && !key(_alt_abajopersonaje) && !key(_alt_izquierdapersonaje))
					mover_personaje(3,1);
				end
			end
			
			frame;
		end
	end
