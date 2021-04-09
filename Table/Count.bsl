// Description:
// Returns table rows count
//
// Parameters:
// TestedTable object

StandardProcessing = false;

count = 0;
_.GotoFirstRow ();
rows = _.GetSelectedRows ();
if ( rows.Count () > 0 ) then // TestedClient crash workaround
	_.SelectAllRows ();
	count = _.GetSelectedRows ().Count ();
endif;

return count;