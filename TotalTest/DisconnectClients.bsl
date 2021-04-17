for i = 0 to 5 do
	try
		Connect ( , AppData.Port + i );
		Disconnect ( true );
	except
	endtry;
enddo;
