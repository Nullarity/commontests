profile = new InternetMailProfile ();
profile.SMTPServerAddress = _.SMTPServer;
profile.SMTPUser = _.SMTPUser;
profile.SMTPPassword = _.SMTPPassword;
if ( _.SMTPPort <> undefined ) then
	profile.SMTPPort = _.SMTPPort;
endif;
if ( _.SMTPUseSSL <> undefined ) then
	profile.SMTPUseSSL = _.SMTPUseSSL;
endif;

msg = new InternetMailMessage ();
msg.From = _.From;
msg.To.Add ( _.To );
msg.Subject = _.Subject;
msg.Texts.Add ( _.Body );

attachment = _.Attachment;
if ( attachment <> undefined ) then
	msg.Attachments.Add ( new BinaryData ( attachment ), "Attachment.jpg" );
endif;

mail = new InternetMail ();
mail.Logon ( profile );
mail.Send ( msg );
mail.Logoff ();
