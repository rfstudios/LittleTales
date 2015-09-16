/*
	Este fichero contiene funciones sobre ficheros
*/

function fcopia(string origen, string destino)
	private
		int pfich,pfich2;
		int dato;
	end
	begin
		pfich=fopen(origen,0);
		pfich2=fopen(destino,2);
		
		repeat
			fread(pfich,dato);
			fwrite(pfich2,dato);
		until(feof(pfich));
	end
