stack = Debug.Stack [ Debug.Level - 1 ];
if ( stack.IsVersion
	or __.TestServer
	or not locked ( stack.Module ) ) then
	Pause(1);
	return TestingID ();
else
	return _;
endif;

&AtServer
Function locked ( Module )

	s = "
	|select allowed top 1 1
	|from Catalog.Scenarios as Scenarios
	|	//
	|	// Editing
	|	//
	|	join InformationRegister.Editing as Editing
	|	on Editing.Scenario = Scenarios.Ref
	|	and Editing.User = &Me
	|where Scenarios.Code = &Module
	|";
	q = new Query ( s );
	q.SetParameter ( "Module", Module );
	q.SetParameter ( "Me", SessionParameters.User );
	return not q.Execute ().IsEmpty ();

EndFunction