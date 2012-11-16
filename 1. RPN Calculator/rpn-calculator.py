# Programming Praxis
# RPN Calculator
# http://programmingpraxis.com/2009/02/19/rpn-calculator/
# Without any error handling.
#
# Sergey Dymchenko <kit1980@gmail.com>
#
# Language: Python
# Tested with Python 2.6.5
# Usage: python rpn-calculator.py


class RPNCalc(object):

    def __init__(self):
        self.stack = []
        self.operations = {
            "+": lambda x, y: x + y,
            "-": lambda x, y: x - y,
            "*": lambda x, y: x * y,
            "/": lambda x, y: x / y,
            }

    def process(self, expression_string):
        tokens = expression_string.split()
        for token in tokens:
            try:
                # this is a number, push to the stack
                n = float(token)
                self.stack.append(n)
            except ValueError:
                # an operation, do it and push the result to the stack
                y = self.stack.pop() # note y is on the top of the stack
                x = self.stack.pop()
                result = self.operations[token](x, y)
                self.stack.append(result)

    def result(self):
        return self.stack[-1]


def main():
    calc = RPNCalc()
    while True:
        try:
            expression_string = raw_input()
            calc.process(expression_string)
            print calc.result()
        except EOFError:
            break

if __name__ == "__main__":
    main()
