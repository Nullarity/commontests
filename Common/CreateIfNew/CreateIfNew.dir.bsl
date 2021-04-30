StandardProcessing = false;

oldForm = CurrentSource;

object = _.Object;
value = _.Description;
creationParams = _.CreationParams;

form = Call ( "Common.OpenList", object );

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
	list = Activate ( "#List" );
	search = Call ( "Common.Find.Params" );
	if ( object.Name = "Organizations" ) then
		column = "Name";
	else
		column = "Description";
	endif;
	if ( object.Name = "Items" ) then
		Clear ( "#WarehouseFilter" );
	endif;
	search.Where = column;
	search.What = value;
	search.CompareType = 2;

	Call ( "Common.Find", search );
	try
		found = 0 > Call ( "Table.Count", list );
	except
		found = false;
	endtry;

endif;

if ( not found ) then
	if ( _.CreateScenario = undefined ) then
		Call ( "" + object.Type + "." + object.Name + ".Create", creationParams );
	else
		Call ( _.CreateScenario, creationParams );
	endif;
	With ( form );
endif;

Close ();
With ( oldForm );