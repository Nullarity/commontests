// Create update cf-file

cmd = Call ( "Tester.Infobase.Common.Prepare", _ );
file = GetTempFileName ( "cf" );
cmd = cmd + " /CreateDistributionFiles -cffile """ + file + """";
if ( Call ( "Tester.Infobase.Common.Run", cmd ) <> 0 ) then
	Stop ( _.IBName + " distribution file creation error occured" );
endif;
return file;