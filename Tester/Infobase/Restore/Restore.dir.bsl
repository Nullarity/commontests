result = undefined;
cmd = new Array ();
if ( _.Platform = undefined ) then
	cmd.add ( """C:\Program Files (x86)\1cv8\common\1cestart.exe""" );
else
	cmd.add ( """%Platform""" );
endif;
cmd.add ( "designer /DisableStartupMessages /RestoreIB ""%Path"" /IBname ""%IBName"" /N ""%IBUser""" );
if ( _.PermissionCode <> undefined ) then
	cmd.Add ( "/UC ""%PermissionCode""" );
endif;
if ( _.IBPassword <> undefined ) then
	cmd.Add ( "/p ""%IBPassword""" );
endif;
command = StrConcat ( cmd, " " );
RunApp ( Output.Sformat ( command, _ ), , true, result );
if ( result <> 0 ) then
	Stop ( _.IBName + " database restoration error. Source file is: " + _.Path );
endif;
