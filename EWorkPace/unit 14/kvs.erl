-module (kvs).
-export ([start/0,store/2,lookup/1]).
%程序开始入口	注册一个 kvs 的进程 并且关连 导loop函数
start() -> register(kvs,spawn(fun() -> loop() end)).
%存放

%d调用rpc 把K和V存放于 消息q中
store(Key,Value) ->rpc({store,Key,Value}).


lookup(Key) -> rpc({lookup,Key}).
%rpc主要是给 kvs进程发送 Q信息的
rpc(Q) ->
	kvs! {self(),Q},
	io:format("jincheng rpc:~p ~n",[self()]),
		receive 
				{kvs,Replay} ->Replay
		end.
loop()->
  	receive
  		%进程接受到存放消息，使用进程字典存放K和V 并回复结果给kvs
  		{Form,{store,Key,Value}} ->
  			put(Key,{ok,Value}),
  			Form ! {kvs,true},
  			loop();
  		{Form,{lookup,Key}} ->
  			Form ! {kvs,get(Key)},
  			loop()
  	end.