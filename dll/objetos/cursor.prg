/*
  Este archivo contiene el cursor señalador
*/

process cursor()
	begin
		x=-10;
		file=fpgs[0];
		graph=4;
		
		if(father.menutype!=5)
			flags=1;
		else
			flags=0;
		end
		z=-1;
		loop
			frame;
		end
	end