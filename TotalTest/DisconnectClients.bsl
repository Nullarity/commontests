// Disconnect gently
for i = 0 to 5 do
	try
		Connect ( , AppData.Port + i );
		Disconnect ( true );
	except
	endtry;
enddo;

// Kill
RunApp ( "pkill -f 1cv8c.*testclient", , true );
Pause ( 3 );
// Kill
RunApp ( "pkill -f 1cv8c.*TESTCLIENT", , true );
Pause ( 3 );

// Terminate
RunApp ( "pkill -9 -f 1cv8c.*testclient", , true );
Pause ( 3 );
RunApp ( "pkill -9 -f 1cv8c.*TESTCLIENT", , true );
Pause ( 3 );
