result = undefined;
cmd = new Array ();
if ( _.Platform = undefined ) then
	cmd.add ( "/opt/1cv8/common/1cestart.exe" );
else
	cmd.add ( """%Platform""" );
endif;
cmd.add ( "designer /DisableSplash /DisableStartupDialogs /DisableStartupMessages /RestoreIB ""%Path"" /IBname ""%IBName"" /N ""%IBUser""" );
if ( _.PermissionCode <> undefined ) then
	cmd.Add ( "/UC ""%PermissionCode""" );
endif;
if ( _.IBPassword <> undefined ) then
	cmd.Add ( "/p ""%IBPassword""" );
endif;
log = GetTempFileName ( "txt" );
cmd.Add ( "/out""" + log + """" );
command = StrConcat ( cmd, " " );
RunApp ( Output.Sformat ( command, _ ), , true, result );
if ( result <> 0 ) then
	doc = new TextDocument ();
	doc.Read ( log );
	content = doc.GetText ();
	Stop ( _.IBName + " database restoration error. Source file is: " + _.Path + ", Log: " + content );
endif;
DeleteFiles ( log );