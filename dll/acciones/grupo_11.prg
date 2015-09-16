/*
	Acciones de evento de grupo 11
*/	
function llamar_menu()
	begin	
		signal(type gameobject,s_freeze_tree);
		signal(personajeid,s_freeze_tree);
		
		ingmenu();	
		/* Fundido desde negro */
			cambiar_tono_pantalla(0,0,0,0);
			fade(100,100,100,30);
			while(fading)
				frame;
			end
		
		signal(type gameobject,s_wakeup_tree);
		signal(personajeid,s_wakeup_tree);
	end
	
function menu_guardar()
	begin
	
	end
	
function game_over()
	begin		
		signal(type gameobject,s_freeze_tree);
		signal(personajeid,s_freeze_tree);
		
		fade(0,0,0,30);
		while(fading)
			frame;
		end
		
		mostrar_imagen(modo_x/2,modo_y/2,1,0,6,1);
		fade_on();
	end
	
function llamar_mainmenu()
	begin
		mapid=0;
	end