goal([4, _, _]).
goal([_, 4, _]).
goal([_, _, 4]).

action(O, N) :- empty_1(O, N).
action(O, N) :- empty_2(O, N).
action(O, N) :- empty_3(O, N).
action(O, N) :- full_1(O, N).
action(O, N) :- full_2(O, N).
action(O, N) :- full_3(O, N).
action(O, N) :- pour_1_2(O, N).
action(O, N) :- pour_1_3(O, N).
action(O, N) :- pour_2_1(O, N).
action(O, N) :- pour_2_3(O, N).
action(O, N) :- pour_3_1(O, N).
action(O, N) :- pour_3_2(O, N).

empty_1([_, S, T], [0, S, T]).
empty_2([F, _, T], [F, 0, T]).
empty_3([F, S, _], [F, S, 0]).
full_1([_, S, T], [8, S, T]).
full_2([F, _, T], [F, 5, T]).
full_3([F, S, _], [F, S, 3]).
pour_1_2([OF, OS, T], [NF, NS, T]) :- M is OF + OS, M > 5, NF is M - 5, NS is 5.
pour_1_2([OF, OS, T], [NF, NS, T]) :- M is OF + OS, M =< 5, NF is 0, NS is M.
pour_1_3([OF, S, OT], [NF, S, NT]) :- M is OF + OT, M > 3, NF is M - 3, NT is 3.
pour_1_3([OF, S, OT], [NF, S, NT]) :- M is OF + OT, M =< 3, NF is 0, NT is M.
pour_2_1([OF, OS, T], [NF, NS, T]) :- M is OF + OS, M > 8, NS is M - 8, NF is 8.
pour_2_1([OF, OS, T], [NF, NS, T]) :- M is OF + OS, M =< 8, NS is 0, NF is M.
pour_2_3([F, OS, OT], [F, NS, NT]) :- M is OS + OT, M > 3, NS is M - 3, NT is 3.
pour_2_3([F, OS, OT], [F, NS, NT]) :- M is OS + OT, M =< 3, NS is 0, NT is M.
pour_3_1([OF, S, OT], [NF, S, NT]) :- M is OF + OT, M > 8, NT is M - 8, NF is 8.
pour_3_1([OF, S, OT], [NF, S, NT]) :- M is OF + OT, M =< 8, NT is 0, NF is M.
pour_3_2([F, OS, OT], [F, NS, NT]) :- M is OS + OT, M > 5, NT is M - 5, NS is 5.
pour_3_2([F, OS, OT], [F, NS, NT]) :- M is OS + OT, M =< 5, NT is 0, NS is M.

dfs(CNode, CPath, [CNode | CPath]) :- goal(CNode), !.
dfs(CNode, CPath, FPath) :- action(CNode, N), N \= CNode, \+member(N, CPath), dfs(N, [CNode | CPath], FPath).