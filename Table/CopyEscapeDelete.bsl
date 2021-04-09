StandardProcessing = false;

table = _;
commands = table.GetCommandBar ();

Click ( "Copy", commands );
table.EndEditRow ();
table.DeleteRow ();

question = App.FindObject ( Type ( "TestedForm" ), DialogsTitle );
if ( question <> undefined ) then
	Click ( "Yes", question );
endif;

Click ( "Copy", commands );
table.EndEditRow ( true );