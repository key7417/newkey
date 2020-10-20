-module (my_ex_demo).
-export ([check/1]).
-include_lib("kernel/include/file.hrl").

	get_info(File)	->
		case file:read_file_info(File) of
		
		{ok,Info} -> {Info#file_info.mtime};

			_	->{{0,0,0},{0,0,0}}

		end.

	check(FileName) ->
			Btime=get_info(FileName++".beam"),

			Etime=get_info(FileName++".erl"),
io:format("~p~n~p~n",[FileName++".beam",FileName++".erl"]),
			%erl修改文件时间大于编译文件beam的修改时间就去编译他
			D=calendar:datetime_to_gregorian_seconds(Etime) - calendar:datetime_to_gregorian_seconds(Btime),
			case D>0 of
				
				true -> erlang:c(FileName++".erl");
				

				false -> {"nothing to do"}
			end.