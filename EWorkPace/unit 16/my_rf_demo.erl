-module (my_rf_demo).
-export ([consult/1,unconsult/2]).

consult(File)	->
	case file:open(File,read) of
		{ok,Item}	-> read(Item);
		{error,Why}	->{error,Why}

	end.


read(Item)->
	case io:read(Item,'') of
		{ok,Dat}	->	
			[Dat|read(Item)];
		{eof}	->
			[],
			file:close(Item);
		Error -> Error,file:close(Item)

	end.
	unconsult(File,L)	->
		{ok,S} = file:open(File,write),
		lists:foreach(fun(X) -> io:format(S,"~p.~n",[X]) end,L),
		file:close(S).
