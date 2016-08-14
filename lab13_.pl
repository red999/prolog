sum([],[]).

sum([A, B, C|T], [Sum|T1]):-
	Sum is (A+B+C)/3,
	sum(T,T1).
sum([T], [Sum]) :-
	Sum is T/3.
sum([A,B], [Sum]) :-
	Sum is (A+B)/3.

start:-
	writef("Enter List << "),
	read(List),
	writef("Enter Sum << "),
	read(Sum),
	sum(List,Sum),
	write(Sum).



do:-
	write('input list: '),
	read(L),
	left(L,Res),
	write('Result is: '),
	write(Res).

left([H|T],L2):-
	append(T,[H],L2).
