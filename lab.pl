search(X, [X|_]).
search(X, [_|Xs]) :- search(X, Xs).

search2(X, [X,X|_]).
search2(X, [_|Xs]):- search2(X,Xs).

search_two(X, [X,_,X|_]).
search_two(X, [_|Xs]) :- search_two(X,Xs).

search_anytwo(X, [X|T]) :- search(X,T).
search_anytwo(X, [_|Xs]) :- search_anytwo(X,Xs).

size([],0).
size([_|T],M) :- size(T,N), M is N+1.

psize([],zero).
psize([_|T],s(N)) :- psize(T,N).

sum([],0).
sum([H|T],N) :- sum(T,M), N is M+H. 

average(L,A) :- average(L,0,0,A).
average([],C,S,A) :- A is S/C.
average([X|Xs],C,S,A) :- C2 is C+1, S2 is S+X, average(Xs,C2,S2,A).


max([X],X).
max([X|Xs],X) :- max(Xs,N), X>=N.
max([X|Xs],N) :- max(Xs,N), X<N.

maxmin([X],X,X).
maxmin([X|Xs],X,Min) :- maxmin(Xs,Max,Min), X>=Max.
maxmin([X|Xs],Max,X) :- maxmin(Xs,Max,Min), X=<Min.
maxmin([X|Xs],Max,Min) :- maxmin(Xs,Max,Min), X<Max, X>Min.

all_bigger([X],[Y]) :- X > Y.
all_bigger([X|Xs],[Y|Ys]):- X > Y, all_bigger(Xs,Ys).

sublist([],L2).
sublist([X|Xs],L2) :- search(X,L2), sublist(Xs,L2).

% fully fully no, ma si può fare ovviamente seq(5,L) ma non seq(N,L)
seq(0,[]).
seq(N,[0|T]):- N > 0, N2 is N-1, seq(N2,T).

seqR(0,[0]).
seqR(N,[N|L]):- N > 0,  N2 is N-1, seqR(N2,L).

last([],X,[X]).
last([H|T],X,[H|M]) :- last(T,X,M).

seqR2(0,[0]).
seqR2(N,L):- N > 0, N2 is N-1, seqR2(N2,L2), last(L2,N,L).

inv([],[]).
inv([H|T],LR) :- inv(T,LR2), last(LR2,H,LR).

append([],L,L).
append([H|T],L,[H|M]):- append(T,L,M).

double(L,LD) :- append(L,L,LD).

times(L,1,L).
times(L,N,LT) :- N>1, N2 is N-1,times(L,N2,LT2),append(LT2,L,LT).

proj([[H|_]],[H]).
proj([[H|_]|T2],P) :- proj(T2,P2), append([H],P2,P).
