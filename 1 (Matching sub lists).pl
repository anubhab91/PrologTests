%Matching sub lists
%Note that `accept([0, 1, 0, 0]).` will be proved false.
%%%%%%Output (in SWI Prolog)%%%%%%%%
%%?- accept([1, 0, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0]).
%%true.
%%
%%?- accept([1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1]).
%%false.
%%%%%%%%

accept(List) :- 
	append(_Left1, [0, 1|_Rest], List), 
	append(X, [1, 0, 0|_Right2], _Rest), 
	append(_Right2,Y, _Rest), 
	(accept(X), accept(Y)),
	!.

accept(List) :- 
	append(_, [0, 1|_Rest], List),
	!,
	fail.
	
accept(List) :- 
	!.