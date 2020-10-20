-module (math_functions).
-export ([even/1,odd/1,filter/2]).


even(L) ->(L rem 2)=:=1.
odd(L) 	->(L rem 2)=:=0.
filter(F,L) ->[
				X||
				X<-L,
				F(X)=:=true
				].

split(L) ->split(L,[],[]).
split(L,[],[])	->

	case L rem 2 of
		1  -> [L,Odd,[Even|L]].

		2	->[L,[Odd|L],Even].
	end;
split(L)	->   Odd=[X||X<-L,(X rem 2)=/=0],
				Even=[X||X<-L,(X rem 2)=:=0],
				{Even,Odd}.
