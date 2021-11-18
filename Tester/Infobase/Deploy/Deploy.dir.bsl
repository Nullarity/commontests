// Performs the following tasks:
// - Lock infobase
// - Restore infobase (optional)
// - Update configuration
// - Unlock infobase

lock ( true, _.Server, _.IBUser, _.IBPassword );
restore ( _ );
update ( _ );
lock ( false, _.Server, _.IBUser, _.IBPassword );

Procedure lock ( Lock, Server, User, Password )
	
	connector = new ServerAdministration ( Server );
	clusters = connector.GetClusters ();
	for each cluster in clusters do
		cluster.Authenticate ();
		infobases = cluster.GetInfoBases ();
		for each ibase in infobases do
			if ( ibase.Name = "agrimatco" ) then
				ibase.Authenticate ( User, Password );
				if ( Lock ) then
					start = CurrentDate ();
					ibase.LockBeginTime = start;
					ibase.LockMessage = "Infobase is updating";
					ibase.SessionStartPermissionCode = "ConfigurationUpdate";
				endif;
				ibase.LockScheduledJobs = Lock;
				ibase.SessionsLockEnabled = Lock;
				ibase.Write ();
				if ( Lock ) then
					sessions = ibase.GetSessions ();
					for each session in sessions do
						if ( session.ApplicationName <> "RAS" ) then
							try
								session.TerminateSession ();
							except
							endtry;
						endif;
					enddo;
				endif;
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
