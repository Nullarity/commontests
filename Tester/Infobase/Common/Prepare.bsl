cmd = new Array ();
if ( _.Platform = undefined ) then
	cmd.add ( """C:\Program Files (x86)\1cv8\common\1cestart.exe""" );
else
	cmd.add ( """%Platform""" );
endif;
cmd.Add ( "designer /DisableStartupMessages" );
if ( _.IBName <> undefined ) then
	cmd.Add ( "/IBName ""%IBName""" );
endif;
if ( _.IBUser <> undefined ) then
	cmd.Add ( "/N ""%IBUser""" );
endif;
if ( _.IBPassword <> undefined ) then
	cmd.Add ( "/P ""%IBPassword""" );
endif;
if ( _.RepoUser <> undefined ) then
	cmd.Add ( "/ConfigurationRepositoryN ""%RepoUser""" );
endif;
if ( _.RepoAddress <> undefined ) then
	cmd.Add ( "/ConfigurationRepositoryF ""%RepoAddress""" );
endif;
if ( _.RepoPassword <> undefined ) then
	cmd.Add ( "/ConfigurationRepositoryP ""%RepoPassword""" );
endif;
if ( _.PermissionCode <> undefined ) then
	cmd.Add ( "/UC ""%PermissionCode""" );
endif;
return Output.Sformat ( StrConcat ( cmd, " " ), _ );
