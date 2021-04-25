// Disconnect gently 5 potential sessions
for i = 0 to 5 do
	try
		Connect ( , AppData.Port + i );
		Disconnect ( true );
	except
	endtry;
enddo;

// Kill with changes to survive
RunApp ( "pkill -f 1cv8c.*testclient", , true );
Pause ( 3 );
RunApp ( "pkill -f 1cv8c.*TESTCLIENT", , true );
Pause ( 3 );

// Massacre
RunApp ( "pkill -9 -f 1cv8c.*testclient", , true );
Pause ( 3 );
RunApp ( "pkill -9 -f 1cv8c.*TESTCLIENT", , true );
Pause ( 3 );
