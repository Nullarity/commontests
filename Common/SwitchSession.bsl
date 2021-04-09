// Disconnect from current session and connect to another

StandardProcessing = false;

userName = _;
ports = __.Ports;

if ( userName = undefined ) then
	port = AppData.Port;
else
	port = ports [ userName ];
endif;

if ( port = undefined ) then
	Stop ( "Can't define user's port" );
endif;

Disconnect ();
Connect ( , port );
