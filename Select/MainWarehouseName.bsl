MainWindow.ExecuteCommand ( "e1cib/data/Catalog.UserSettings?ref=829cd067e53706fd11e5032227b94ddd" );
With ( "*(User Settings)" );
c = Fetch ( "#Warehouse" );
Close ();
return c;
