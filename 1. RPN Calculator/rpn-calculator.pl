# Programming Praxis
# RPN Calculator
# http://programmingpraxis.com/2009/02/19/rpn-calculator/
# Without any error handling.
#
# Sergey Dymchenko <kit1980@gmail.com>
#
# Language: Perl
# Tested with perl 5.10.1
# Usage: perl rpn-calculator.pl

use strict;
use warnings;

use Scalar::Util qw(looks_like_number);

package RPN;

sub new {
    my $class = shift;
    my $self = {
        stack => [],
    };
 
    bless $self, $class;
    return $self;
}

sub process {
    my $self = shift;
    my $expression_string = shift;
    my @tokens = split(' ', $expression_string);
    foreach my $token (@tokens) {
        if (Scalar::Util::looks_like_number($token)) {
            # this is a number, push to the stack
            push @{$self->{stack}}, $token;
        } else {
            # an operation, do it and push the result to the stack
            my $y = pop @{$self->{stack}}; # note y is on top of the stack
            my $x = pop @{$self->{stack}};
            my $result;

            $result = $x + $y if $token eq "+";
            $result = $x - $y if $token eq "-";
            $result = $x * $y if $token eq "*";
            $result = $x / $y if $token eq "/";

            push @{$self->{stack}}, $result;
        }
    }
}

sub result {
    my $self = shift;
    return $self->{stack}[-1];
}

package main;

my $calc = RPN->new();
while (my $expression_string  = <STDIN>) {
    $calc->process($expression_string);
    print $calc->result(), "\n";
}
