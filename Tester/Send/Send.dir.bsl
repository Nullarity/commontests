profile = new InternetMailProfile ();
profile.SMTPServerAddress = _.SMTPServer;
profile.SMTPUser = _.SMTPUser;
profile.SMTPPassword = _.SMTPPassword;
profile.SMTPUseSSL = true;

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
