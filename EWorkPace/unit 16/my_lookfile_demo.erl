-module (my_lookfile_demo).
-export ([look/1]).
-include_lib("kernel/include/file.hrl").
look(File)	->
	case file:read_file_info(File) of
		{ok,Info} -> {Info#file_info.type,Info#file_info.size};
		_ -> error
	end.
	