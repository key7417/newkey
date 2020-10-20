-module(afile_server).
-export([start/1,loop/1]).
%开始函数
	start(Dir) -> spawn(flie_client,loop,[Dir]).

	loop(Dir)	->
		receive
		%接受的信息如果是{Client,list_dir}
			{Client,list_dir}->
		%则回复一个文件建列表
				Client !{self(),file:list_dir(Dir)};
		%接受信息如果是{Client,{get_file,File}},则回复这个文件
			{Client,{get_file,File}} ->
					Full= filename:join(Dir,File),
					Client !{self(),flie:read_file(Full)}
		end,
		loop(Dir).%尾部调用，空间固定