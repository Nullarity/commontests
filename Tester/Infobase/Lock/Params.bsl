StandardProcessing = false;

p = new Structure ();
p.Insert ( "Lock", true ); // True is Locking, False is Unlocking
p.Insert ( "LockJobs", true ); // True is Locking, False is Unlocking
p.Insert ( "ClusterUser" ); // Optional
p.Insert ( "ClusterPassword" ); // Optional
p.Insert ( "ServerUser" ); // Optional
p.Insert ( "ServerPassword" ); // Optional
p.Insert ( "Server" );
p.Insert ( "ServerIBName" );
p.Insert ( "PermissionCode" );
p.Insert ( "IBName" );
p.Insert ( "IBUser" );
p.Insert ( "IBPassword" ); // Optional

return p;