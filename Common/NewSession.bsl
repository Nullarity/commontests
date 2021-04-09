// Runs 1c with specified user.
// If 1c was active before then it will be closed before running again

StandardProcessing = false;

userName = _;
ports = __.Ports;

// Find port
port = ports [ userName ];
if ( port = undefined ) then
	last = 0;
	for each entry in ports do
		if ( last < entry.Value ) then
			last = entry.Value;
		endif;
	enddo;
	port = ? ( last = 0, AppData.Port, last + 1 );
endif;

// Disconnecting
Disconnect ();

// Disconnect previous session
try
	Connect ( , port );
	CloseAll ();
	Disconnect ( true );
except
endtry;

// Run 1c
p = Call ( "Tester.Run.Params" );
p.Port = port;
p.User = _;
p.IBase = __.IBase;
tenant = __.Tenant;
additional = new Array ();
if (tenant <> undefined) then
	additional.Add ( "/z " + tenant );
endif;
if ( __.TestServer ) then
	additional.Add ( "/Debug http -attach" );
endif;
if ( additional.Count () > 0 ) then
	p.Parameters = StrConcat ( additional, " " );
endif;
Call("Tester.Run", p);
MaximizeWindow();
Connect(, port);
ports [ userName ] = port;