-module (mystudy).
-export ([my_tuple_to_list/1]).

my_tuple_to_list(L) ->[element(X,L)||X<-lists:seq(1,tuple_size(L))].

