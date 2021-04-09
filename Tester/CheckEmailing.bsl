this.Insert("SMTPServer", "<...>");
this.Insert("SMTPUser", "<...>");
this.Insert("SMTPPassword", "<...>");
this.Insert("SMTPUseSSL", false);
this.Insert("SMTPPort", 0);
this.Insert("To", "<...>"); // Адрес получателя

client();
server();

&AtClient
Procedure client()

    profile = new InternetMailProfile();
    profile.SMTPServerAddress = this.SMTPServer;
    profile.SMTPUser = this.SMTPUser;
    profile.SMTPPassword = this.SMTPPassword;
    profile.SMTPUseSSL = this.SMTPUseSSL;
    profile.SMTPPort = this.SMTPPort;
    message = new InternetMailMessage();
    message.From = this.SMTPUser;
    message.To.Add(this.To);
    message.Subject = "Test";
    message.Texts.Add("Body");
    mail = new InternetMail();
    try
        mail.Logon(profile);
        mail.Send(message);
        mail.Logoff();
        Message("Client ok");
    except
        Message("Client error: " + ErrorDescription());
    endtry;

EndProcedure

&AtServer
Procedure server()

    profile = new InternetMailProfile();
    profile.SMTPServerAddress = this.SMTPServer;
    profile.SMTPUser = this.SMTPUser;
    profile.SMTPPassword = this.SMTPPassword;
    profile.SMTPUseSSL = this.SMTPUseSSL;
    profile.SMTPPort = this.SMTPPort;
    message = new InternetMailMessage();
    message.From = this.SMTPUser;
    message.To.Add(this.To);
    message.Subject = "Test";
    message.Texts.Add("Body");
    mail = new InternetMail();
    try
        mail.Logon(profile);
        mail.Send(message);
        mail.Logoff();
        Message("Server ok");
    except
        Message("Server error: " + ErrorDescription());
    endtry;

EndProcedure