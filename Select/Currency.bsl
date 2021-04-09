With ( "Currencies" );
list = Activate ( "#List" );
search = new Map ();
search.Insert ( "Code", _ );
list.GotoRow ( search, RowGotoDirection.Down );
Click ( "#FormChoose" );