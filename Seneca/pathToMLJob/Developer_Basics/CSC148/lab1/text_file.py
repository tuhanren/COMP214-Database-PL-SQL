from __future__ import annotations
from typing import Any, Optional
import urllib.request
import os
from typing import TextIO
from io import StringIO


class Mystery:
    """A mystery class without any implementation.
    """
    pass


class Parent:
    """An arbitrary class
    """
    num1: int

    def __init__(self, num1: int) -> None:
        self.num1 = num1


class Child(Parent):
    """A subclass.
    """
    num2: int

    def __init__(self, num1: int, num2: int) -> None:
        # Parent.__init__(self, num1)
        super().__init__(num1)
        self.num2 = num2


class Printer:
    """A Printer.

    === Attributes ===
    message: the message to print
    """
    message: str

    def __init__(self, message: str) -> None:
        self.message = message

    def print_message(self):
        """Prints a message.
        """
        print(self.message)


class MysteryPrinter(Printer):
    def __init__(self, message: str) -> None:
        Printer.__init__(self, message + message)


class DoublePrinter(MysteryPrinter):
    def print_message(self):
        print(self.message + self.message)


class _Node:
    """
    === Attributes ===
    """
    item: Any
    next: Optional[_Node]

    def __init__(self, item: Any) -> None:
        self.item = item
        self.next = None


class LinkedList:
    def __init__(self, items: list) -> None:
        if not items:
            self._first = None
        else:
            self._first = _Node(items[0])
            curr = self._first
            for item in items[1:]:
                curr.next = _Node(item)
                curr = curr.next

    def __str__(self) -> str:
        items = []
        curr = self._first
        while curr is not None:
            items.append(str(curr.item))
            curr = curr.next
        return "[" + " -> ".join(items) + "]"


def read_molecule(reader: TextIO) -> Optional[list]:
    """Read a single molecule from reader and return it, or return None to
    signal end of file. The first item in the result is the name of the
    compound; each list contains an atom type and the X, Y, and Z coordinates
    of that atom.
    >>> instring = 'COMPND TEST\\nATOM 1 N 0.1 0.2 0.3\\nATOM 2 N 0.2 0.1 ' \
                   '0.0\\nEND\\n'
    >>> infile1 = StringIO(instring)
    >>> read_molecule(infile1)
    ['TEST', ['N', '0.1', '0.2', '0.3'], ['N', '0.2', '0.1', '0.0']]
    """
    # tmp_line = reader.readline().strip()
    tmp_line = reader.readline()
    if not tmp_line:
        return None
    parts = tmp_line.split()
    name = parts[1]
    molecule = [name]
    reading = True
    while reading:
        # tmp_line = reader.readline().strip()
        tmp_line = reader.readline()
        if tmp_line.startswith('END'):
            reading = False
        else:
            parts = tmp_line.split()
            molecule.append(parts[2:])

    return molecule


if __name__ == '__main__':
    file = open('file_examples/file_example.txt', 'r')
    contents = file.read()
    print(contents)
    file.close()
    print(contents)
    m = Mystery()
    print(m)
    # c = Child(1, 2)
    # print(c.num2)
    # print(c.num1)
    m1 = Printer('hello')
    m2 = MysteryPrinter('good')
    m3 = DoublePrinter('bye')
    m1.print_message()
    m2.print_message()
    m3.print_message()

    l1 = LinkedList(list(range(3)))
    print(l1)
    print()
    # with open('file_examples/file_example.txt', 'r') as file:
    #     first10 = file.read(10)
    #     rest_contents = file.read()
    #
    # print(first10)
    # print()
    # print(rest_contents)

    os.chdir("C:/Users/YvaineShaw/PycharmProjects/pythonProject/csc148/lab1/")
    print(os.getcwd())
    # To look in the directory above the current working directory
    # open('../data1.txt', 'r')

    # f.read(), f.readlines(), f.readline() moves the file cursor
    # read() return whole content into a string
    # readlines() return whole content into a list of string

    # with open('file_examples/file_example.txt', 'r') as file:
    #     contents = file.readlines()

    # can use list method such as sort

    with open('file_examples/file_example.txt', 'r') as file:
        for line in file:
            print(line.strip())

    url = 'https://robjhyndman.com/tsdldata/ecology1/hopedale.dat'
    with urllib.request.urlopen(url) as webpage:
        for line in webpage:
            line = line.strip()
            line = line.decode('utf-8')
            print(line)

    with open('topics.txt', 'w') as output_file:
        output_file.write('Computer Science')

    with open('topics.txt', 'a') as output_file:
        output_file.write('\nSoftware Engineering')

    input_string = 'COMPND TEST\nATOM 1 N 0.1 0.2 0.3\nATOM 2 N 0.2 0.1 ' \
                   '0.0\nEND\n'
    infile = StringIO(input_string)
    print(infile.readlines())
    outfile = StringIO()
    outfile.write('1.3 3.4\n')
    print(outfile.getvalue())
    value = '123124124.'
    # unselect the last char
    print(value[:-1])
    lst = []
    with open('file_examples/file_example.txt', 'r') as f:
        line = f.readline()
        print(line + 'test')
        lst.append(line)
        print(lst)
