// Update configuration from repository

edt = _.EDT;
if ( edt = undefined ) then
	cmd = Call ( "Tester.Infobase.Common.Prepare", _ );
	cmd = cmd + " /ConfigurationRepositoryUpdateCfg -force /UpdateDBCfg";
	if ( Call ( "Tester.Infobase.Common.Run", cmd ) <> 0 ) then
		Stop ( _.IBName + " database updating error occured" );
	endif;
else
	cmd = new Array ();
	cmd.Add ( "!/bash/sh" );
	cmd.Add ( "cd " + _.GitFolder );
	cmd.Add ( "git pull https://" + _.GitUser + ":" + _.GitPassword + "@" + _.GitRepo + " -f" );
	folder = GetTempFileName ();
	CreateDirectory ( folder );
	cmd.Add ( "ring " + edt + " workspace export --workspace-location """ + _.Workspace + """ --project-name " + _.Project + " --configuration-files " + folder );
	file = GetTempFileName ( "sh" );
	body = new TextDocument ();
	body.SetText ( StrConcat ( cmd, Chars.LF ) );
	body.Write ( file, TextEncoding.System );
	result = 0;
	RunApp ( "sh " + file, , true, result );
	if ( result <> 0 ) then
		Stop ( "ring edt@xxx workspace export error: " + result );
	endif;
	DeleteFiles ( file );
	cmd = Call ( "Tester.Infobase.Common.Prepare", _ );
	log = GetTempFileName ( "txt" );
	cmd = cmd + " /out""" + log + """ /DisableSplash /DisableStartupDialogs /DisableStartupMessages /LoadConfigFromFiles """ + folder + """ -force /UpdateDBCfg";
	result = Call ( "Tester.Infobase.Common.Run", cmd );
	if ( result <> 0 ) then
		doc = new TextDocument ();
		doc.Read ( log );
		content = doc.GetText ();
		Stop ( _.IBName + " database updating error occured. Folder with config files: " + folder + ", Log: " + content );
	endif;
	DeleteFiles ( log );
	DeleteFiles ( folder );
endif;
