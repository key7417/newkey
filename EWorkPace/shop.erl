-module (shop).
-export ([cost/1,total/1,total1/1]).
-import (lists, [map/2,sum/1]).

cost(orange) 	-> 5;
cost(newspaper)	-> 2;
cost(apples)	-> 9;
cost(milk)		-> 7.
%逐步提取列表首部进行相加
total(L)	->
	sum(map(  fun({What,N}) ->shop:cost(What)*N end,L)).	


total1(P) ->
	sum([cost(A)*B||{A,B}<-P]).