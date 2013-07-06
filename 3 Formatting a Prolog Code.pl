%Formatting a Prolog Code
%Tested in SWI Prolog
%%%%%Output not written in external file
	
%%%%%%%%%
%%ASCII values
%32 = space
%9 = tab
%3 = end_of_file
%46 = .
%10 = newline
%59 = ;
%44 = ,
%45 = -
%58 = :
%%%%%%%%%

%%%%%%%%%
%%Sample output
%1 ?- format('sample.pl').
%man(caeser).
%mortal(X):-
%    man(X).
%man(plato).
%man(socrates).
%%%%%%%%%

format(FileName):-
	see(FileName),
    repeat,
    get_char(Char),
	forall(
		(
		Char \= end_of_file,
		name(Char, List), 
		nth0(_, List, FirstChar)
		), 
		( 
		%%%%%(FirstChar = 32);
		(FirstChar = 9); 
		(FirstChar = 10);
		(FirstChar = 46, put(FirstChar), nl); 
		(FirstChar = 44, put(FirstChar), nl, tab(4));
		(FirstChar = 59, put(FirstChar), nl, tab(4)); 
		(FirstChar = 45, put(FirstChar), nl, tab(4)); 
		put(FirstChar)
		)
		),
	Char = end_of_file,
	!,
	seen.