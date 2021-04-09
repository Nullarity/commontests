cmd = Call ( "Tester.Infobase.Common.Prepare", _ );
cmd = cmd + " /ConfigurationRepositoryCommit -force /UpdateDBCfg";
if ( Call ( "Tester.Infobase.Common.Run", cmd ) <> 0 ) then
	Stop ( _.IBName + " repository commit or dbupdate error occured" );
endif;
