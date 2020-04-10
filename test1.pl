% question1,example call func1([1,2,3],X).
func1([H],H).
func1([H|T],Z):-((func1(T,Z1),H>Z1) -> Z is H;func1(T,Z1),Z is Z1).


% question2,example call func2([s1,2,3],[1]).
mem(H,[H|T]).
mem(X,[H|T]):-mem(X,T).
inter(S1,S2):-mem(X,S1),mem(X,S2).
func2(S1,S2):- \+inter(S1,S2).


% question3,example call func3([1,2,3],[4],X).
func3([],Z,Z).
func3([H|T],Y,Z):- mem(H,Y),func3(T,Y,Z).
func3([H|T],Y,[H|T2]):- \+mem(H,Y),func3(T,Y,T2).


% question4,example call func4([1,2,3],X).
func4([Z],Z).
func4([H|T],Z):-func4(T,Z1),Z is Z1.


% question5,example call func5([1,2,3],[1,2],X).
mergeList([],Y,Y).
mergeList([H|T],Y,[H|T2]):-mergeList(T,Y,T2).
crossPro([],Y,[]).
crossPro([H|T],Y,[(H,Y)|Z]):-crossPro(T,Y,Z).
func5(X,[],[]).
func5(X,[H|T],Z):-crossPro(X,H,Z1),func5(X,T,Z2),mergeList(Z1,Z2,Z).
