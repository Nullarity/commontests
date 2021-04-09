Choose ( "#UserSettingsValue" );
With ( "Select period" );
Set ( "#DateBegin", Format ( _.ValueFrom, "DLF=D" ) );
Set ( "#DateEnd", Format ( _.ValueTo, "DLF=D" ) );
Pause (1);
Click ( "#Select" );
