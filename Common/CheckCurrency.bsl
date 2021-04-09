form = _;

localCurrency = __.LocalCurrency;

Check ( "#Currency", localCurrency );
Check ( "#Rate", "1" );
Check ( "#Factor", "1" );
CheckState ( "#Rate, #Factor", "Enable", false );

// ***********************************
// Change Currency and check again
// ***********************************

Set ( "#Currency", "CAD" );
form.GotoNextItem ();

Activate ( "#Rate" );
CheckState ( "#Rate, #Factor", "Enable" );

cadRate = Fetch ( "#Rate" );
if ( cadRate = "1" ) then
	Stop ( "CAD currency rate should not be 1. Check CurrencyOnChange event handler and currency rates" );
endif;

Set ( "#Currency", localCurrency );
form.GotoNextItem ();
