% Programming Praxis
% International Mathematical Olympiad. IMO 1960 Problem 01
% Determine all three-digit numbers N having the property that N is divisible by 11, and N/11 is equal to the sum of the squares of the digits of N.
% http://programmingpraxis.com/2009/07/17/international-mathematical-olympiad/
%
% Author: Sergey Dymchenko <kit1980@gmail.com>
%
% Language: ECLiPSe Prolog (http://eclipseclp.org/)
% Tested with ECLiPSe Version 6.0 #183
% Usage: eclipse -b imo-1960-01.ecl -e "solve"

:- lib(ic).

solve :-
    Digits = [A, B, C],
    Digits :: [0..9],
    A #> 0,
    
    N #= A * 100 + B * 10 + C,
    
    % #= requires N / 11 to be an integer (N is divisible by 11)
    A * A + B * B + C * C #= N / 11,
    
    labeling(Digits),
    writeln(N),
    
    % fail to find all solutions
    fail.
