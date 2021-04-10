StandardProcessing = false;

p = new Structure ();
p.Insert ( "Application" );
p.Insert ( "Platform" ); // Optional
p.Insert ( "ClusterUser" ); // Optional
p.Insert ( "ClusterPassword" ); // Optional
p.Insert ( "ServerUser" ); // Optional
p.Insert ( "ServerPassword" ); // Optional
p.Insert ( "Server" );
p.Insert ( "ServerIBName" );
p.Insert ( "PermissionCode" );
p.Insert ( "IBName" ); // Infobase name in the 1C:Starter list
p.Insert ( "IBUser" );
p.Insert ( "IBPassword" ); // Optional
p.Insert ( "Restore" ); // Optional. Path to the demo db
p.Insert ( "RepoAddress" );
p.Insert ( "RepoUser" );
p.Insert ( "RepoPassword" ); // Optional

return p;