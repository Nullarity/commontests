// Description:
// Clears table
//
// Parameters:
// TestedTable object

StandardProcessing = false;

_.GotoFirstRow ();
rows = _.GetSelectedRows ();
if ( rows.Count () > 0 ) then // TestedClient crash workaround
	_.SelectAllRows ();
	Click ( "#" + _.Name + "Delete" );
endif;
