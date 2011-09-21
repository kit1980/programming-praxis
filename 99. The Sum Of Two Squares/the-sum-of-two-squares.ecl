% Programming Praxis
% The Sum Of Two Squares
% http://programmingpraxis.com/2010/01/05/the-sum-of-two-squares/
% Straightforward solution.
%
% Author: Sergey Dymchenko <kit1980@gmail.com>
%
% Language: ECLiPSe Prolog (http://eclipseclp.org/)
% Tested with ECLiPSe Version 6.0 #183
% Usage: eclipse -b the-sum-of-two-squares.ecl -e "solve"

:- lib(ic).

model(N, X, Y) :-
    X #>= 0,
    Y #>= 0,
    X #>= Y, % break symmetry 
    X * X + Y * Y #= N.

find(X, Y) :-
    % Could be labeling([X, Y]),
    % but search is faster here.
    search([X, Y], 0, input_order, indomain_split, complete, []).

input(N) :-
    % read positive (will not work for negatives!) integer number
    read_token(N, integer).
    
output(X, Y) :-
    printf("%d %d\n", [X, Y]).
    
solve :-
    input(N),
    model(N, X, Y),
    find(X, Y),
    output(X, Y),
            
    % fail to find all solutions
    fail.
    