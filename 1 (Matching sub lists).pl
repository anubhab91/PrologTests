%Matching sub lists
%Note that `accept([0, 1, 0, 0]).` will be proven false.

%%%%%%Output (in SWI Prolog)%%%%%%%%
%%?- accept([1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0]).
%%true.
%%
%%?- accept([1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1]).
%%false.
%%%%%%%%

accept(List) :- 
	append(_, [0, 1|Rest], List), 
	append(InBetween, [1, 0, 0|RightMost], Rest), 
	(accept(InBetween), accept(RightMost)),
	!.

accept(List) :- 
	append(_, [0, 1|Rest], List),
	!,
	fail.
	
accept(List):-!.