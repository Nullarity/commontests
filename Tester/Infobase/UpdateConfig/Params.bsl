StandardProcessing = false;
p = Call("Tester.Infobase.Common.Params");
p.Insert ("File");
if ( _ <> undefined ) then
	FillPropertyValues ( p, _ );
endif;
return p;