StandardProcessing = false;

p = new Structure ();
p.Insert ( "Name" ); // "Customer"
p.Insert ( "Comparison" );
p.Insert ( "Value" );
p.Insert ( "SelectValue", false );
p.Insert ( "Period", false );
p.Insert ( "ValueFrom" );
p.Insert ( "ValueTo" );
p.Insert ( "ChangeUsage", false ); // Set True if you want to change Use flag
p.Insert ( "UserFilter", true ); // Set False if filter is not placed in User Settings
p.Insert ( "Calendar", false );
p.Insert ( "Date" );
return p;
