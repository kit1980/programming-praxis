# Programming Praxis
# Sieve of Eratosthenes
# http://programmingpraxis.com/2009/02/19/sieve-of-eratosthenes/
#
# Sergey Dymchenko <kit1980@gmail.com>
#
# Language: Perl
# Tested with perl 5.10.1
# Usage: perl sieve-of-eratosthenes.pl

use strict;
use warnings;

use Set::Light; # CPAN module

sub sieve {
    my $n = shift;

    my $primes = Set::Light->new();
    # init with 2 and odd numbers >= 3
    $primes->insert(2);
    for (my $i = 3; $i <= $n; $i += 2) {
        $primes->insert($i);
    }

    for (my $i = 3; $i <= $n; $i += 2) {
        if ($primes->has($i)) {
            for (my $j = $i; $j * $i <= $n; $j++) {
                $primes->delete($i * $j);
            }
        }
    }

    return $primes;
}

my $n = <STDIN>;
my $primes = sieve($n);

## print primes
# for (my $i = 1; $i <= $n; $i++) {
#    if ($primes->has($i)) {
#        print $i, " ";
#    }
#}

print $primes->size(), "\n";
