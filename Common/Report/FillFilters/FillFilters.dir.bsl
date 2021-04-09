form = CurrentSource;
settings = Activate ( "#UserSettings" );

for each filter in _.Filters do
	comparison = filter.Comparison;
	userFilter = filter.UserFilter;
	value = filter.Value;
	clearValue = not ValueIsFilled ( value );
	valueFrom = filter.ValueFrom;
	valueTo = filter.ValueTo;
	changeUsage = filter.ChangeUsage;
	period = filter.Period;
	calendar = filter.Calendar;

	settings.GotoFirstRow ();
	Pause ( 1 );
	search = new Map ();
	search.Insert ( "Setting", ? ( userFilter, filter.Name, "Filter" ) );
	settings.GotoRow ( search );
	
	if ( userFilter ) then
		if ( comparison <> undefined ) then
			Activate ( "#UserSettingsComparisonType", settings );
			settings.ChangeRow ();
			Set ( "#UserSettingsComparisonType", comparison, settings );
			settings.EndEditRow ();
		endif;

		if ( period ) then
			Activate ( "#UserSettingsValue", settings );
			settings.ChangeRow ();
			Run ( "SelectPeriod", filter );
			if ( settings.CurrentModeIsEdit () ) then
				settings.EndEditRow ();
			endif;
		else
			if ( value <> undefined ) then
				if ( Calendar ) then
				    settings.Choose ();
					field = settings.GetObject ( , "Value", "UserSettingsValue" );
					field.StartChoosing ();
					formChoice = With ( "Choice Date" );
					field = formChoice.GetObject ( , "Date", "Date" );
					field.GoToDate ( filter.Date );
					field.GoToDate ( filter.Date );
					field.GoToDate ( filter.Date );
					field.StartChoosing ();
					With ( form );
					settings = Activate ( "#UserSettings" );
				    Put ( "#UserSettingsValue", value, settings );
					settings.EndEditRow ();
				else
					Set ( "#UserSettingsValue", value, settings );
				endif;
			endif;
		endif;

		if ( changeUsage ) then
			Activate ( "#UserSettingsUse", settings );
			Click ( "#UserSettingsUse", settings );
		endif;
	else
		settings.ChangeRow ();
		Choose ( "#UserSettingsValue" );
		With ( "Edit filter" );
		table = Activate ( "#FilterAvailableFields" );
		search = new Map ();
		search.Insert ( "Available fields", filter.Name );
		table.GotoRow ( search );
		Click ( "#FilterAvailableFieldsChoose" );
		table = Activate ( "#Data" );
		search = new Map ();
		search.Insert ( "Field", filter.Name );
		table.GotoRow ( search );
		
		if ( comparison <> undefined ) then
			Activate ( "#DataComparisonType", table );
			table.ChangeRow ();
			Set ( "#DataComparisonType", comparison, table );
			settings.EndEditRow ();
		endif;
		
		if ( period ) then
			Activate ( "#DataRightValue", table );
			table.ChangeRow ();
			Run ( "SelectPeriod", filter );
			table.EndEditRow ();
		else
			if ( value <> undefined ) then
				Activate ( "#DataRightValue", table );
				table.ChangeRow ();
				if ( filter.SelectValue ) then
					Pick ( "#DataRightValue", value, table );
				else
					if ( clearValue ) then
						Clear ( "#DataRightValue" );
					else
						Set ( "#DataRightValue", value, table );
					endif;
				endif;
				table.EndEditRow ();
			endif;
		endif;
		
		if ( changeUsage ) then
			Activate ( "#DataUse", table );
			Click ( "#DataUse", table );
		endif;
		
		Click ( "#OK" );
		With ( form );
	endif;
enddo;
