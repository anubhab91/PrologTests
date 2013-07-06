%Minimum cost path of a graph
%Courtesy: http://rlgomes.github.io/work/prolog/2012/05/22/19.00-prolog-and-graphs.html
%Tested in GNU Prolog

%%%%%%%%%%
%% Output %%
%%| ?- find_min_path(FindPath).
%%1->6:3
%%
%%FindPath = [1,2,3,6]
%%
%%yes
%%%%%%%%%%

edge(1,2).
edge(1,4).
edge(2,3).
edge(3,4).
edge(3,6).
edge(5,6).

start(1).
%%%%Adding more start nodes will result in finding minimum cost path from 
%%%every such node to goal node: Dikjstra Algorithm?
%start(2).
%start(3).

%%%%Similar is for end nodes.
end(6).
%%end(4).

%Uniform cost of 1 is assigned to each edge
edge(X,Y,1):-
	edge(X,Y).
	
	
%%%%%%%
%path(X, Y) :- path(X,Y,[]).
%path(X, Y, _) :- edge(X,Y).
%path(X, Y, V) :- \+ member(X, V), edge(X, Z), path(Z, Y, [X|V]).
%%%%%%%
	
%One path is searched for
find_a_path(X, Y, W, [X,Y], _) :- 
	edge(X, Y, W).

find_a_path(X, Y, W, [X|P], V) :- 
	\+ member(X, V),
	edge(X, Z, W1),
	find_a_path(Z, Y, W2, P, [X|V]),
	W is W1 + W2.
								 
:-dynamic(solution/2).
find_min_path(Path):-
	find_min_path(_, Path).
	
find_min_path(_, Path) :-
	forall(findall(_X, start(_X), _List1), nth0(_, _List1, StartNode)),
	start(StartNode),
	forall(findall(_Y, end(_Y), _List2), nth0(_, _List2, EndNode)),
	end(EndNode),
	write(StartNode),
	write(->),
	write(EndNode),
	write(:),
	find_min_path(StartNode, EndNode, Cost, Path),
	write(Cost).

find_min_path(X, Y, W, P) :- 
	\+ solution(_, _),
	find_a_path(X, Y, W1, P1, []),
	assertz(solution(W1, P1)),
	!,
	find_min_path(X,Y,W,P).

find_min_path(X, Y, _, _) :- 
	find_a_path(X, Y, W1, P1, []),
	solution(W2, P2),
	W1 < W2,
	retract(solution(W2, P2)),
	asserta(solution(W1, P1)),
	fail.

find_min_path(_, _, W, P) :- 
	solution(W,P), 
	retract(solution(W,P)).