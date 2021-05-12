// Description:
// Opens & Generates Report
//
// Parameters:
// Call ( "Common.Report.Params" )

if ( _.UseOpenMenu ) then
	path = _.Path;
	if ( StrStartsWith ( path, "e1cib/" ) ) then
		Commando(path);
	else
		OpenMenu ( _.Path );
	endif;
endif;	
form = With ( ? ( _.Title = undefined, undefined, _.Title ) );

settings = Get ( "#UserSettings" );
if ( not settings.CurrentVisible () ) then
	Click ( "#CmdOpenSettings" );
endif;

Run ( "FillFilters", _ );

try
  except
     With ( "Cash Book" );
     UserSettings = Get ( "#UserSettings" );
     search = new Map ();
     search [ "Comparison type" ] = "";
     search [ "Setting" ] = "Period";
     search [ "Use" ] = "No";
     search [ "Value" ] = "Last year";
     UserSettings.GotoRow ( search, RowGotoDirection.Up );
     Choose ( "#UserSettingsValue", UserSettings );

     With ( "Select period" );
     PeriodVariantTable = Get ( "#PeriodVariantTable" );
     search = new Map ();
     search [ "Value" ] = "Last year";
     PeriodVariantTable.GotoRow ( search, RowGotoDirection.Up );
     PeriodVariantTable.Choose ();
     With();
endtry;


if ( _.Generate ) then
	Click ( "#GenerateReport" );
endif;

return CurrentSource;
