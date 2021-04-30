StandardProcessing = false;
p = new Structure ();
p.Insert ( "Recording", false );
p.Insert ( "Application" );
p.Insert ( "Version" ); // Optional
p.Insert ( "Platform", "C:\Program Files\1cv8\8.3.15.1489\bin\1cv8.exe" ); // Optional
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
p.Insert ( "Restore" ); // Optional. Path to the testing db
p.Insert ( "RepoAddress" );
p.Insert ( "RepoUser" );
p.Insert ( "RepoPassword" ); // Optional
p.Insert ( "TestEnvironment" ); // Optional. Path to the scenario which will test environment before running other tests
p.Insert ( "Folder" ); // Optional. Test scenarios in this folder only
p.Insert ( "Exceptions" ); // Optional. Array of excuded from testing scenarios
p.Insert ( "UpdateOnly", false ); // Do not run tests
p.Insert ( "TestingOnly", false ); // Do not update
p.Insert ( "EDT" ); // Optional, edt version, for instance: edt@1.15.0:x86_64
p.Insert ( "Ring", "/opt/1C/1CE/components/1c-enterprise-ring-0.11.10+2-x86_64/ring" );

// The following parametes are mandatory if EDT parameter defined
p.Insert ( "Project" ); // Edt project name
p.Insert ( "Workspace" ); // Path to the local edt workspace
p.Insert ( "GitFolder" ); // Path to the local git folder
p.Insert ( "GitUser" );
p.Insert ( "GitPassword" );
p.Insert ( "GitRepo" ); // Remote repository (without protocol http(s))

return p;