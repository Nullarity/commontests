// change locking mecanism to 8.3.15
return;
try
	connector = new COMObject ( "V83.COMConnector" );
except
	Message ( "Creating of V83.COMConnector has encountered an error" );
	return;
endtry;
agent = connector.ConnectAgent ( _.Server );
agent.AuthenticateAgent ( _.ServerUser, _.ServerPassword );
clusters = agent.GetClusters ();
for each cluster in clusters do
	agent.Authenticate ( cluster, _.ClusterUser, _.ClusterPassword );
	lock = _.Lock;
	result = toggler ( not lock, _.LockJobs, connector, agent, cluster, _ );
	if ( result  = undefined ) then
		continue;
	endif;
	if ( lock ) then
		disconnect ( connector, agent, cluster, _ );
	endif;
	break;
enddo;

Function toggler ( Online, JobsDenied, Connector, Agent, Cluster, Params )
	
	for each processInfo in Agent.GetWorkingProcesses ( Cluster ) do
		if ( processInfo.Running and processInfo.IsEnable ) then
			connection = processInfo.HostName + ":" + Format ( processInfo.MainPort, "NG=" );
			process = connector.ConnectWorkingProcess ( connection );
			process.AuthenticateAdmin ( Params.ClusterUser, Params.ClusterPassword );
			process.AddAuthentication ( Params.IBUser, Params.IBPassword );
			ibases = process.GetInfoBases ();
			for each ibase in ibases do
				if ( targetIB ( Params, ibase ) ) then
					jobsDenied = ibase.ScheduledJobsDenied;
					ibase.ScheduledJobsDenied = JobsDenied;
					ibase.SessionsDenied = not Online;
					ibase.PermissionCode = Params.PermissionCode;
					process.UpdateInfobase ( ibase );
					result = new Structure ( "JobsDenied", jobsDenied );
					return result;
				endif;
			enddo; 
		endif;
	enddo;
	return undefined;
	
EndFunction

Function targetIB ( Params, IBase )
	
	return Lower ( Params.ServerIBName ) = Lower ( IBase.Name );
	
EndFunction

Function disconnect ( Connector, Agent, Cluster, Params )
	
	ibases = Agent.GetInfoBases ( Cluster );
	for each ibase in ibases do
		if ( targetIB ( Params, ibase ) ) then
			sessions = Agent.GetInfoBaseSessions ( Cluster, ibase );
			for each session in sessions do
				Agent.TerminateSession ( Cluster, session );
			enddo; 
		endif;
	enddo; 
	
EndFunction
