StandardProcessing = false;

if ( FindMessages ( "Failed to save*" ).Count () = 0
	and FindMessages ( "Не удалось записать*" ).Count () = 0 ) then
	Stop ( "<Failed to save> dialog box must be shown" );
endif;
Click ( "OK", Forms.Get1C () ); // Closes 1C standard dialog
if ( FindMessages ( _ ).Count () <> 1 ) then
	Stop ( "<" + _ + "> error messages must be shown one time" );
endif;
