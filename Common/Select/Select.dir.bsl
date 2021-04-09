
object = _.Object;
value = _.Search;
creationParams = ? ( _.CreationParams = undefined, value, _.CreationParams );
quick = _.QuickChoice;

if ( quick ) then
	field = _.Field;
	field.OpenDropList ();
	try
		field.ExecuteChoiceFromDropList ( value );
		found = true;
	except
		found = false;
	endtry;
else
	if ( _.Header = undefined ) then
		form = With ( ? ( object.ListPresentation = "", object.Synonym, object.ListPresentation ) );
	else
		from = With ( _.Header );
	endif;
	
	if ( object.Name = "Addresses" ) then
		p = Call ( "Common.Find.Params" );
		p.Where = "Description";
		p.What = value;
		Call ( "Common.Find", p );
		
		With ( form );
		
		try
			Fetch ( "Description", Get ( "#List" ) );
			found = true;
		except
			found = false;
		endtry;
	else
		try
			list = Activate ( "#List" );
		except
			list = Activate ( "#Список" );
		endtry;
		search = new Map ();
		if ( object.Name = "Organizations" ) then
			column = "Name";
		else
			column = "Description";
		endif;
		search.Insert ( column, value );
		list.GotoFirstRow ();
		
		try
			found = list.GotoRow ( search, RowGotoDirection.Down );
		except	
			found = false;
		endtry;	
	endif;
endif;

if ( not found ) then
	n = ? ( _.Property ( "App" ), _.App, undefined );
	if ( _.CreateScenario = undefined ) then
		Call ( "" + object.Type + "." + object.Name + ".Create", creationParams, n );
	else
		Call ( _.CreateScenario, creationParams, n );
	endif;
	if ( quick ) then
		field.OpenDropList ();
		field.ExecuteChoiceFromDropList ( value );
	else
		With ( form );
		Click ( "#FormRefresh" );
		if ( object.Name = "Addresses" ) then
			p = Call ( "Common.Find.Params" );
			p.Where = "Description";
			p.What = value;
			Call ( "Common.Find", p );
			With ( form );
		else
			list = Activate ( "#List" );
			list.GotoFirstRow ();
			list.GotoRow ( search, RowGotoDirection.Down );
		endif;
	endif;
endif;

if ( not quick ) then
	if ( _.Choose ) then
		Click ( "#FormChoose" );
	else
		Close ();
	endif;
endif;