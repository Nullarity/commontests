StandardProcessing = false;

if ( _.Type = "Catalogs" ) then
	part = "Catalog";
elsif ( _.Type = "Documents" ) then
	part = "Document";
elsif ( _.Type = "InformationRegisters" ) then
	part = "InformationRegister";
endif;

MainWindow.ExecuteCommand ( "e1cib/list/" + part + "." + _.Name );

caption = Call ( "Common.Meta.Caption", _ );

form = With ( caption );
return form;
