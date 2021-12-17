// Init global values
// The "__" value is global and can be used everywhere

StandardProcessing = false;
SpecialFields.LineNo = "#";

if (__ = undefined) then
	__ = new Structure("Ports, CheckLogic, LocalCurrency, ComputerName, TestServer, Company, Performance, IBase, Tenant, Files, AdminUser");
else
	return;
endif;
__.Ports = new Map ();
__.CheckLogic = true;
__.LocalCurrency = "MDL";
computer = ComputerName();
__.ComputerName = computer;
testServer = Left ( computer, 2 ) = "tc";
__.TestServer = testServer;
if ( testServer ) then
	__.AdminUser = "admin" + Mid ( computer, 3 );
else
	__.AdminUser = "admin";
endif;
__.Company = "ABC Distributions";
__.IBase = AppName;
__.Tenant = "0C931F556B";
__.Performance = 1;
if (__.TestServer) then
	__.Files = "/home/dmitry/testing/" + AppName + "/";
	__.Performance = 2;
else
	if ( Framework.IsLinux () ) then
		__.Files = "/home/dmitry/testing/" + AppName + "/Files/";
	else
		__.Files = "/%USERPROFILE%/Testing/" + AppName + "/";
	endif;
endif;
if ( IAmAgent ) then
	PinApplication(AppName);
	MinimizeWindow ( "Tester..+" );
endif;
try
	Connect();
except
	runClient();
	Connect();
endtry;

__.Ports [ "admin" ] = AppData.ConnectedPort;

&AtClient
Procedure runClient ()
	
	p = Call("Tester.Run.Params");
	p.User = __.AdminUser;
	p.IBase = __.IBase;
	tenant = __.Tenant;
	params = new Array ();
	params.Add ( "/len" );
	if (tenant <> undefined) then
		params.Add ( "/z " + tenant );
	endif;
	p.Parameters = StrConcat ( params, " " );
	Call("Tester.Run", p);
	MaximizeWindow();
	
EndProcedure
