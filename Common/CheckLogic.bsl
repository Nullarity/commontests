StandardProcessing = false;

if ( not __.CheckLogic ) then
	return;
endif;

stack = Debug.Stack [ Debug.Level - 1 ];
t = RuntimeSrv.GetSpreadsheet ( stack.Module, stack.IsVersion );
CheckTemplate ( _, , , t );
