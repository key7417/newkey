-module (get_for).
-export ([for/3,map/2,sum/1]).

for(Max,Max,F) ->[F(Max)];
for(I,Max,F) ->[F(I)|for(I+1,Max,F)].

map(_, []) ->[];
map(F, [H|T]) ->[F(H)|map(F,T)].

sum([H|T]) ->H+sum(T);
sum([]) ->0.
