// Description:
// Creates memo with passed ID.
// Used for stamping testing data as a sign that testing environment has been created.
//
// Parameters:
// String, data ID

Commando ( "e1cib/data/Task.UserTask" );
With ( "Task (create)" );

Put ( "#Memo", _ );
Put ( "#Start", "01/01/2000" );
Put ( "#Finish", "01/01/2000" );
Click ( "#FormOK" );
