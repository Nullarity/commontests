cmd = Call ( "Tester.Infobase.Common.Prepare", _ );
cmd = cmd + " /ConfigurationRepositoryLock";
if ( Call ( "Tester.Infobase.Common.Run", cmd ) <> 0 ) then
	Stop ( _.IBName + " repository locking error occured" );
endif;
