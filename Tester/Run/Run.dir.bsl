// Runs 1C application client of testing
// Parameters:
// Structure, Tester.Run.Parameters

run1C ( _ );
connect1C ( _ );
suppressSafety ( _ );

Procedure run1C ( Params )
	
	if ( Framework.IsLinux () ) then
		cmd = """/opt/1cv8/common/1cestart"" enterprise";
	else
		cmd = """C:\Program Files\1cv8\common\1cestart.exe"" enterprise";
	endif;
	p = Params.IBase;
	if ( p <> undefined ) then
		cmd = cmd + " /IBName """ + p + """";
	endif;
	p = Params.User;
	if ( p <> undefined ) then
		cmd = cmd + " /N """ + p + """";
	endif;
	p = Params.Password;
	if ( p <> undefined ) then
		cmd = cmd + " /P """ + p + """";
	endif;
	p = Params.Port;
	if ( p = undefined ) then
		cmd = cmd + " /TESTCLIENT ";
	else
		cmd = cmd + " /TESTCLIENT -TPORT " + Format ( p, "NG=0" );
	endif;
	p = Params.Processor;
	if ( p = undefined ) then
		openProcessor = false;
	else
		cmd = cmd + " /Execute """ + p + """";
		openProcessor = true;
	endif;
	p = Params.Parameters;
	if ( p <> undefined ) then
		cmd = cmd + " " + p;
	endif;
	RunApp ( cmd );
	
EndProcedure

Procedure connect1C ( Params )
	
	wait = Params.Wait;
	if ( wait = undefined ) then
		return;
	endif;
	begin = CurrentDate ();
	while ( true ) do
		try
			Connect ( , Params.Port );
			break;
		except
		endtry;
		passed = CurrentDate () - begin;
		if ( passed > wait ) then
			break;
		endif;
	enddo;
	
EndProcedure

Procedure suppressSafety ( Params )
	
	if ( Params.Processor = undefined ) then
		return;
	endif;
	if ( not Waiting ( "1?:*" ) ) then
		return;
	endif;
	form = With ( "1?:*" );
	field = Type ( "TestedFormField" );
	label = form.FindObject ( field, "Предупреждение безопасности*" );
	if ( label = undefined ) then
		label = form.FindObject ( field, "Security warning*" );
		yes = "Yes";
		if ( label = undefined ) then
			return;
		endif;
	else
		yes = "Да";
	endif;
	Click ( yes );
	
EndProcedure
