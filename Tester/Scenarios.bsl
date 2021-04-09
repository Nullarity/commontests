return getList(_.Name, _.Exceptions, _.Folder);

&AtServer
Function getList(Application, Exceptions, Folder)
	
	s = "
		|select allowed Scenarios.Ref as Scenario
		|from Catalog.Scenarios as Scenarios
		|where not Scenarios.DeletionMark
		|and Scenarios.Type = value ( Enum.Scenarios.Scenario )
		|and Scenarios.Application.Description = &Application
		|and Scenarios.Path not like ""Trash%""
		|";
	if (Folder <> undefined) then
		s = s + "
			|and Scenarios.Path like """ + Folder + ".%""
			|";
	endif;
	if (Exceptions <> undefined) then
		s = s + "
			|and Scenarios.Path not in ( &Exceptions )
			|";
	endif;
	s = s + "
		|order by Scenarios.Description
		|";
	q = new Query(s);
	q.SetParameter("Application", Application);
	q.SetParameter("Exceptions", Exceptions);
	return q.Execute().Unload().UnloadColumn("Scenario");
	
EndFunction