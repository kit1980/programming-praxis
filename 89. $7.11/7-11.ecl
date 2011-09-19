% Programming Praxis
% $7.11
% http://programmingpraxis.com/2009/11/27/7-11/
% Pretty straightforward solution.
%
% Author: Sergey Dymchenko <kit1980@gmail.com>
%
% Language: ECLiPSe Prolog (http://eclipseclp.org/)
% Tested with ECLiPSe Version 6.0 #183
% Usage: eclipse -b 7-11.ecl -e "solve"

:- lib(ic).

solve :-
    % Work with integers - cents.
    Sum = 711,
    Product = 711,
    Prices = [A, B, C, D],
    A #> 0, B #> 0, C #> 0, D #> 0,

    A + B + C + D #= Sum,
    A * B * C * D #= Product * 1000000,
    
    % Break symmetry.
    % There are also other ways to do this, see
    % http://sourceforge.net/mailarchive/forum.php?thread_name=4E6F3DC9.8010105%40web.de&forum_name=eclipse-clp-users
    A #=< B,
    B #=< C,
    C #=< D,
   
    % labeling(Prices),
    % would work, but would be too slow.
    %
    % For comparison of the search strategies see
    % http://sourceforge.net/mailarchive/forum.php?thread_name=4E6F3DC9.8010105%40web.de&forum_name=eclipse-clp-users
    search(Prices, 0, input_order, indomain_split, complete, []),

    % Convert to floats.
    Af is A / 100,
    Bf is B / 100,
    Cf is C / 100,
    Df is D / 100,
    printf("%.2f %.2f %.2f %.2f\n", [Af, Bf, Cf, Df]).
