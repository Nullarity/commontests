// Performs the following tasks:
// - Lock infobase
// - Restore infobase (optional)
// - Update configuration
// - Unlock infobase

disconnect ( _ );
restore ( _ );
update ( _ );

Procedure disconnect ( Params )
	
	connector = new ServerAdministration ( Params.Server );
	clusters = connector.GetClusters ();
	for each cluster in clusters do
		cluster.Authenticate ();
		infobases = cluster.GetInfoBases ();
		for each ibase in infobases do
			if ( ibase.Name = AppName ) then
				ibase.Authenticate ( Params.IBUser, Params.IBPassword );
				sessions = ibase.GetSessions ();
				for each session in sessions do
					if ( session.ApplicationName <> "RAS" ) then
						session.TerminateSession ();
					endif;
				enddo;
				return;
			endif;
		enddo;
	enddo;
	
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
