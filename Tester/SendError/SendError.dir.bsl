scenario = _.Scenario;
photo = takePhoto ();
errors = Call ( "Tester.Errors", _.Date );
p = Call ( "Tester.Send.Params" );
p.From = getSender ();
p.To = DF.Pick ( scenario, "Creator.Email" );
p.Subject = "Scenario errors: " + scenario;
p.Body = StrConcat ( errors, Chars.LF );
p.Attachment = photo;
Call ( "Tester.Send", p );

// ***********************************
// Procedures
// ***********************************

Function takePhoto ()

	file = GetTempFileName ( "jpg" );

	shell = new ComObject ( "WScript.Shell" );
	cmd = """& {[void][Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms');"
	+ "$size = [Windows.Forms.SystemInformation]::VirtualScreen;"
	+ "$bitmap = new-object Drawing.Bitmap $size.width, $size.height;"
	+ "$graphics = [Drawing.Graphics]::FromImage($bitmap);"
	+ "$graphics.CopyFromScreen($size.location,[Drawing.Point]::Empty, $size.size);"
	+ "$graphics.Dispose();"
	+ "$bitmap.Save('" + file + "');"
	+ "$bitmap.Dispose()}""";
			
	shell.Run ( "powershell -command " + cmd, 0, "true" );

	return file;
	
EndFunction

&AtServer
Function getSender ()

	return DF.Pick ( SessionParameters.User, "Email" );

EndFunction
