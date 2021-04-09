
return get ( _ );

&AtServer
Function get ( Date )

	s = "
	|select allowed Log.Description as Record
	|from Catalog.ErrorLog as Log
	|where Log.User = &User
	|and Log.Date >= &Date
	|order by Log.Date
	|";
	q = new Query ( s );
	q.SetParameter ( "User", SessionParameters.User );
	q.SetParameter ( "Date", Date );
	return q.Execute ().Unload ().UnloadColumn ( "Record" );

EndFunction
