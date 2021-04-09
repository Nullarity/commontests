StandardProcessing = false;

p = new Structure ();
p.Insert ( "Path" ); // "Sales / Customer debt" or "e1cib/app/Report.Debts"
p.Insert ( "Title" ); // "Customer debt". Optional.
p.Insert ( "Generate", true ); // If it is true report will be generated
p.Insert ( "Filters", new Array () ); // Array of Call ( "Common.Report.Filter" )
p.Insert ( "UseOpenMenu", true );
return p;

