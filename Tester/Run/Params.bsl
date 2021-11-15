StandardProcessing = false;

p = new Structure ();
p.Insert ( "User" );
p.Insert ( "Password" );
p.Insert ( "IBase" );
p.Insert ( "Port", AppData.Port );
p.Insert ( "Wait", 180 );
p.Insert ( "Processor" );
p.Insert ( "Parameters" );
return p;