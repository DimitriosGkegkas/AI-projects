find_similar_movies(X, Y,P) :- distinct(find_similar_movies_d(X, Y,P) ).


find_similar_movies_d(X, Y,5) :-
    same_director(X,Y),
    same_genre_range_d(X, Y,1),
    X \= Y.

find_similar_movies_d(X, Y,4) :-
    same_plot_range_d(X, Y,1),
    same_genre_range_d(X, Y,2),
    year(X,A),
    year(Y,B),
    AL is A-2,
    between(AL, 2020, B),

    X \= Y.

find_similar_movies_d(X, Y,3) :-
    same_actor_range_d(X,Y,1) ,
    (same_genre_range_d(X, Y,2); same_plot_range_d(X, Y,2)),
    X \= Y.

find_similar_movies_d(X, Y,2) :-
    find_similar_movies_d(X, M,5),
    find_similar_movies_d(M, Y,4),
    year(X,A),
    year(Y,B),
    AL is A-2,
    between(AL, 2020, B),

   X \= Y.

find_similar_movies_d(X, Y,1) :-
    find_similar_movies_d(X, M,4),

    find_similar_movies_d(M, Y,3),



    X \= Y.
