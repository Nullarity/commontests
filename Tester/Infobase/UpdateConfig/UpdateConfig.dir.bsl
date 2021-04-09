// Update configuration from file

cmd = Call ( "Tester.Infobase.Common.Prepare", _ );
cmd = cmd + " /UpdateCfg """ + _.File + """ -force";
if ( Call ( "Tester.Infobase.Common.Run", cmd ) <> 0 ) then
	Stop ( _.IBName + " configuration update error occured" );
endif;
