// Performs the following tasks:
// - Lock infobase
// - Restore infobase (optional)
// - Update configuration
// - Unlock infobase

lock ( _, true );
restore ( _ );
update ( _ );
lock ( _, false );

// ********************
// Procedures
// ********************

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

Procedure update ( Params )
	
	p = Call ( "Tester.Infobase.Common.Params" );
	FillPropertyValues ( p, Params );
	Call ( "Tester.Infobase.Update", p );
	
EndProcedure
