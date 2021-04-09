// Common parameters.
// All parameters are optional.

StandardProcessing = false;

p = new Structure ();
p.Insert ( "Platform" );
p.Insert ( "IBName" );
p.Insert ( "IBUser" );
p.Insert ( "IBPassword" );
p.Insert ( "PermissionCode" );
p.Insert ( "RepoAddress" );
p.Insert ( "RepoUser" );
p.Insert ( "RepoPassword" );
p.Insert ( "EDT", undefined );
p.Insert ( "Project" );
p.Insert ( "Workspace" );
p.Insert ( "GitFolder" );
p.Insert ( "GitUser" );
p.Insert ( "GitPassword" );
p.Insert ( "GitRepo" );

return p;