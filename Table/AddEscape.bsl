StandardProcessing = false;

table = _;
if ( table.CurrentModeIsEdit () ) then
	table.EndEditRow ( true );
endif;

commands = table.GetCommandBar ();

Click ( "Add", commands );
table.EndEditRow ( true );