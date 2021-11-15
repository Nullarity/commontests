return getList(_.Name, _.Exceptions, _.Folder);

&AtServer
Function getList(Application, Exceptions, Folder)
	
	s = "
		|select allowed Scenarios.Ref as Scenario
		|from Catalog.Scenarios as Scenarios
		|	//
		|	// Log
		|	//
		|	left join InformationRegister.Log as Log
		|	on Log.Scenario = Scenarios.Ref
		|	and Log.Session = &Session
		|	//
		|	// ExcludeTags
		|	//
		|	left join (
		|		select Tags.Ref as Key
		|		from Catalog.TagKeys.Tags as Tags
		|		where Tags.Tag.Description = ""rebuild""
		|	) as ExcludeTags
		|	on ExcludeTags.Key = Scenarios.Tag
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
		|and ExcludeTags.Key is null
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
		|order by isnull ( Log.Duration, 0 ) desc, Scenarios.Description
		|";
	q = new Query(s);
	q.SetParameter("Session", SessionParameters.Session);
	q.SetParameter("Application", Application);
	q.SetParameter("Exceptions", Exceptions);
	return q.Execute().Unload().UnloadColumn("Scenario");
	
EndFunction