return getList(_.Name, _.Exceptions, _.Folder);

&AtServer
Function getList(Application, Exceptions, Folder)
	
	s = "
		|select allowed Scenarios.Ref as Scenario
		|from Catalog.Scenarios as Scenarios
		|where not Scenarios.DeletionMark
		|and Scenarios.Type = value ( Enum.Scenarios.Scenario )
		|and Scenarios.Application.Description = &Application
		|and Scenarios.Path not like ""Common%""
		|and Scenarios.Path not like ""Select%""
		|and Scenarios.Path not like ""Table%""
		|and Scenarios.Path not like ""Shared%""
		|and Scenarios.Path not like ""Tester%""
		|and Scenarios.Path not like ""Tools%""
		|and Scenarios.Path not like ""TotalTest%""
		|and Scenarios.Path not like ""Trash%""
		|and Scenarios.Path not like ""InitialDatabase%""
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