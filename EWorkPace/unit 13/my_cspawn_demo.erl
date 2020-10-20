-module (my_cspawn_demo).
-export ([init/3,anspawn/0]).

init(Mod,Func,Agrs)->
			Pid=my_spawn(Mod,Func,Agrs),
			% wait(),
			Ref=on_monitor(process,Pid),
			on_exit(Ref,Pid).

my_spawn(Mod,Func,Agrs)->
		statistics(runtime),
		spawn(Mod,Func,Agrs).

on_monitor(process,Pid) ->
			spawn(fun() -> monitor(process,Pid) end).


on_exit(Ref,Pid) ->
		
			receive
				{'DOWN',Ref,process,Pid,Why} ->
					{_,Time}=statistics(runtime),
					io:format("error:~p,time:~p~n",[Why,Time])
				end.		

anspawn()	-> io:format("i have an spawn").

wait() -> 
			receive
			Any ->Any
			after 300 ->
				true
				end.
