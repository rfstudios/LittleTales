function log(string cadena)
	begin
		if(glog)
			say(cadena);
			if(!pf)
				pf=fopen("logs/log_"+ftime("%d%m%Y%H%M%S",time())+".yawlog",2);
			end
			fputs(pf,cadena);
		end
	end