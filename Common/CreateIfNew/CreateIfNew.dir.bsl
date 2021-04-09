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
	search = new Map ();
	if ( object.Name = "Organizations" ) then
		column = "Name";
	else
		column = "Description";
	endif;
	if ( object.Name = "Items" ) then
		Clear ( "#WarehouseFilter" );
	endif;
	search.Insert ( column, value );
	list.GotoFirstRow ();
	try
		found = list.GotoRow ( search, RowGotoDirection.Down );
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