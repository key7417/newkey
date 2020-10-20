-module (four_demo).
-export ([anspawn/0,an_monitor/2]).

anspawn() -> 
	
		receive
			Any-> 
				void
		after 6000->
			io:format("i'm doing ~n"),
			anspawn()
		end	.	
			
an_monitor(process,Pid) ->
		spawn(fun() ->monitor(process,Pid) end).
			
