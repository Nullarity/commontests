StandardProcessing = false;

if ( FindMessages ( _ ).Count () <> 1 ) then
	Stop ( "<" + _ + "> error messages must be shown one time" );
endif;
