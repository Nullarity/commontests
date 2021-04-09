// Description:
// You can use this method for defining if testing environment was created.
//
// Parameters:
// String, data ID
//
// Returns:
// True if data created

Commando ( "e1cib/list/Task.UserTask" );
With ( "User Tasks" );
try
	created = GotoRow ( "#List", "Memo", _ );
except
	created = false;
endtry;
Close ();
return created;