% используя предикат qsort(L,K) из предыдущего задания разработать предикат:
% balanced_tree(L,T) - который по заданном списку строит сбалансированное бинарное дерево поиска
% для построения дерева использовать следующие  нотации:
% empty - пустое дерево 
% instant(R, L, R) - бинарное дерево с корнем R и двумя поддеревьями L и R соотвественно (левое и правое)

split(X,[],[],[]).
split(X,[Y|Remember],[Y|Little],Larger):- X>Y, split(X,Remember,Little,Larger).
split(X,[Y|Remember],Little,[Y|Larger]):- split(X,Remember,Little,Larger).

qsort([],[]).qsort([L|Remember],K) :-
split(L,Remember,Little,Larger),
    qsort(Little,KSmaller),
    qsort(Larger,KBigger),
    append(KLittle,[L|KLarger],K).

$ ?- qsort([6,2,0,1,-5], K).
% K = [-5, 0, 1, 2, 6] .
	
updated_tree(L, T) :- qsort(L, picked_out), 
   updated(picked_out, T).
	
updated([], empty).

updated(L, instant(R, LUnder_wood, RUnder_wood)) :- cutTree(L, Left, [R|Right]),
	updated(Left, LUnder_wood),
	updated(Right, RUnder_wood).

cutTree(L, Left, Right) :- length(L, Count),
	MidC is div(Count, 2),
	length(Left, MidC),
	append(Left, Right, L).
