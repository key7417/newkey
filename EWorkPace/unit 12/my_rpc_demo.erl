-module (my_rpc_demo).
-export ([rpc/2,loop/0]).


start() -> spawn(my_rpc_demo,loop,[]).


%当进行rpc方法，Pid进程id，request请求
rpc(Pid,Reqeust) ->
%向 Pid 发送 当前进程id，和请求
	Pid ! {self(),Reqeust},
%调用当前方法时 返回打印当前进程收到的消息
	receive 
		{Pid,Response} -> Response

	end.

loop() -> 
	receive
		{Form,{rectangle,W,H}}	-> 

			Form !{ self(),W*H},
			loop();
		{Form,{circle,R}}	->
			Form ! {self(),R*R*3.14},
			loop();
		{Form,Other}	->
			Form ! {self(),error,"Other"},
			loop()
	end.	
