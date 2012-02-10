# Programming Praxis
# Sieve of Eratosthenes
# http://programmingpraxis.com/2009/02/19/sieve-of-eratosthenes/
#
# Sergey Dymchenko <kit1980@gmail.com>
#
# Language: Python
# Tested with Python 2.6.5
# Usage: python sieve-of-eratosthenes.py

def sieve(n):
    """
    Return the list of prime numbers less than or equal to n.

    >>> sieve(1)
    []
    >>> sieve(2)
    [2]
    >>> sieve(10)
    [2, 3, 5, 7]
    """

    if n < 2:
        return []

    is_prime = [False] * (n + 1)
    
    # init with 2 and odd numbers >= 3
    is_prime[2] = True
    for i in xrange(3, n + 1, 2):
        is_prime[i] = True

    for i in xrange(3, n + 1, 2):
        if is_prime[i]:
            for j in xrange(i, n / i + 1):
                is_prime[i * j] = False

    primes = []
    for i in xrange(n + 1):
        if is_prime[i]:
            primes.append(i)
    return primes


def main():
    n = int(raw_input())
    primes = sieve(n)
    print len(primes)


if __name__ == "__main__":
    main()
