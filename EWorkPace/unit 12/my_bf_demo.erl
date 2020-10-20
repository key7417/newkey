-module (my_bf_demo).
-export ([loop/0]).

loop()	->
	receive 
		{From,"How are you!"} ->
			io:format(" i'm fine ! ~n"),
			From ! {self(),"i have receive you massage!"},
			loop()


	end.