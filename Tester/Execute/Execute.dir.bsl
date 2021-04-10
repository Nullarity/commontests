// Runs all scenarios for selected application
// Optional tasks:
// - Restoring testing infobase
// - Updating configuration

PinApplication ( _.Application );
version = _.Version;
if ( version <> undefined ) then
	SetVersion ( version );
endif;
if ( not _.TestingOnly ) then
	Call ( "Tester.Infobase.Deploy", _ );
endif;
if ( _.UpdateOnly ) then
	return;
endif;

return;

closeApps ();
testEnvironment ( _ );
runTests ( _ );

// ********************
// Procedures
// ********************

Procedure closeApps ()
	
	// Will try to close previous 5 sessions
	begin = AppData.Port;
	for port = begin to begin + 5 do
		try
			Connect ( , port );
			CloseAll ();
			Disconnect ( true );
		except
		endtry;
	enddo;
	
EndProcedure

Procedure lock ( Params, Locking )
	
	p = Call ( "Tester.Infobase.Lock.Params" );
	FillPropertyValues ( p, Params );
	p.Lock = Locking;
	Call("Tester.Infobase.Lock", p);
	
EndProcedure

Procedure restore ( Params )
	
	restore = Params.Restore;
	if ( restore = undefined ) then
		return;
	endif;
	p = Call ( "Tester.Infobase.Restore.Params" );
	FillPropertyValues ( p, Params );
	p.Path = restore;
	Call ( "Tester.Infobase.Restore", p );
	
EndProcedure

Procedure testEnvironment ( Params )
	
	scenario = Params.TestEnvironment;
	if ( scenario <> undefined ) then
		Call ( scenario );
	endif;
	
EndProcedure

Procedure runTests ( Params )
	
	p = new Structure ();
	p.Insert ( "Name", String ( Params.Application ) );
	p.Insert ( "Folder", Params.Folder );
	p.Insert ( "Exceptions", Params.Exceptions );
	list = Call ( "Tester.Scenarios", p );
	if ( Params.Recording ) then
		RecorderStart ();
	endif;
	for each scenario in list do
		try
			Test.Start ( scenario );
		except
			try
				CloseAll (); // Remove previous errors
			except
			endtry;
		endtry;
	enddo;
	if ( Params.Recording ) then
		RecorderStop ();
	endif;
	
EndProcedure
