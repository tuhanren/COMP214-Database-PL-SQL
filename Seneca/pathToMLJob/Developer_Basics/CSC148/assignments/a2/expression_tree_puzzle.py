"""
CSC148, Winter 2021
Assignment 2: Automatic Puzzle Solver
==============================
This code is provided solely for the personal and private use of
students taking the CSC148 course at the University of Toronto.
Copying for purposes other than this use is expressly prohibited.
All forms of distribution of this code, whether as given or with
any changes, are expressly prohibited.

Authors: Diane Horton, Jonathan Calver, Sophia Huynh,
         Maryam Majedi, and Jaisie Sin.

All of the files in this directory are:
Copyright (c) 2021 Diane Horton, Jonathan Calver, Sophia Huynh,
                   Maryam Majedi, and Jaisie Sin.

=== Module Description ===

This module contains the ExpressionTreePuzzle class.
"""

from __future__ import annotations

from typing import List, Dict

from expression_tree import ExprTree
from puzzle import Puzzle


class ExpressionTreePuzzle(Puzzle):
    """"
    An expression tree puzzle.

    === Public Attributes ===
    variables: the dictionary of variable name (str) - value (int) pairs
               A variable is considered "unassigned" unless it has a
               non-zero value.
    target: the target value for the expression tree to evaluate to

    === Private Attributes ===
    _tree: the expression tree

    === Representation Invariants ===
    - variables contains a key for each variable appearing in _tree

    - all values stored in variables are single digit integers (0-9).
    """
    _tree: ExprTree
    variables: Dict[str, int]
    target: int

    def __init__(self, tree: ExprTree, target: int) -> None:
        """
        Create a new expression tree puzzle given the provided
        expression tree and the target value. The variables are initialized
        using the tree's populate_lookup method.

        >>> puz = ExpressionTreePuzzle(ExprTree('a', []), 4)
        >>> puz.variables == {'a': 0}
        True
        >>> puz.target
        4
        """

        self.variables = {}
        tree.populate_lookup(self.variables)
        self._tree = tree
        self.target = target

    # TODO (Task 5) override is_solved
    def is_solved(self) -> bool:
        """
        Return True iff ExpressionTreePuzzle self is solved.

        The puzzle is solved if all variables have been assigned a non-zero
        value and the expression tree evaluates to the target value.

        >>> exp_t = ExprTree('+', [ExprTree('a', []), ExprTree('b', [])])
        >>> puz = ExpressionTreePuzzle(exp_t, 7)
        >>> puz.is_solved()
        False
        >>> puz.variables['a'] = 7
        >>> puz.is_solved()
        False
        >>> puz.variables['a'] = 5
        >>> puz.variables['b'] = 2
        >>> puz.is_solved()
        True
        """
        tree = self._tree.copy()
        if tree.is_empty():
            return False
        for var in self.variables:
            if self.variables[var] == 0:
                return False
        # expression tree evaluates to target value
        return tree.eval(self.variables) == self.target

    # TODO (Task 5) override __str__
    def __str__(self) -> str:
        """
        Return a string representation of this ExpressionTreePuzzle.

        The first line should show the dictionary of variables and the
        second line should show the string representation of the algebraic
        equation represented by the puzzle.

        >>> exprt = ExprTree('+', [ExprTree('*', \
                                            [ExprTree('a', []), \
                                             ExprTree('+', [ExprTree('b', []), \
                                                            ExprTree(6, []), \
                                                            ExprTree(6, []), \
                                                           ])]), \
                                   ExprTree(5, [])])
        >>> puz = ExpressionTreePuzzle(exprt, 61)
        >>> print(puz)
        {'a': 0, 'b': 0}
        ((a * (b + 6 + 6)) + 5) = 61
        """
        string = str(self.variables) + '\n'
        string += str(self._tree) + ' = ' + str(self.target)
        return string

    # TODO (Task 5) override extensions
    def extensions(self) -> List[ExpressionTreePuzzle]:
        """
        Return the list of legal extensions of this ExpressionTreePuzzle.

        A legal extension is a new ExpressionTreePuzzle equal to this
        ExpressionTreePuzzle, except that it assigns a single currently
        unassigned variable a value in the range 1-9.

        A variable is "unassigned" if it has a value of 0.

        A copy of the expression tree and variables dictionary should be
        used in each extension made, so as to avoid unintended aliasing.

        >>> exp_t = ExprTree('a', [])
        >>> puz = ExpressionTreePuzzle(exp_t, 7)
        >>> exts_of_puz = puz.extensions()
        >>> len(exts_of_puz) == 9
        True
        >>> exts_of_an_ext = exts_of_puz[0].extensions()
        >>> len(exts_of_an_ext) == 0
        True
        >>> exp_t = ExprTree('+', [ExprTree('a', []), ExprTree('b', [])])
        >>> puz = ExpressionTreePuzzle(exp_t, 8)
        >>> exts_of_puz = puz.extensions()
        >>> len(exts_of_puz) == 18
        True
        """
        # temp = []
        # for var in self.variables:
        #     if self.variables[var] == 0:
        #         # unassigned variable a value in the range 1-9.
        #         for i in range(1, 10):
        #             # keep the original list remain the same when new list
        #             is modified
        #             puzzle = ExpressionTreePuzzle(self._tree.copy(),
        #                                           self.target)
        #             puzzle.variables = self.variables.copy()
        #             puzzle.variables[var] = i
        #             # add to new list
        #             temp.append(puzzle)
        # return temp
        tree = self._tree.copy()
        target = self.target
        # make new tree based on target and updated & copied tree
        dic = self.variables
        result = []
        if self._unassigned():
            for var in dic:
                tmp_mapping = dic.copy()
                if dic[var] == 0:
                    for i in range(1, 10):
                        # create a mapping
                        tmp_mapping[var] = i
                        # copy tree
                        t = tree.copy()
                        # update tree
                        t.substitute(tmp_mapping)
                        result.append(ExpressionTreePuzzle(t, target))
            return result
        else:
            return result

    def _unassigned(self) -> bool:
        """
        Return True if there exists unassigned variables in the expression
        puzzle
        >>> exp_t = ExprTree('a', [])
        >>> exp_p = ExpressionTreePuzzle(exp_t, 7)
        >>> exp_p._unassigned()
        True
        >>> exp_t = ExprTree(1, [])
        >>> exp_p = ExpressionTreePuzzle(exp_t, 7)
        >>> exp_p._unassigned()
        False
        """
        variables_dict = self.variables
        if len(variables_dict) == 0:
            return False
        for key in variables_dict:
            if variables_dict[key] == 0:
                return True
        return False

    # TODO (TASK 5): override fail_fast
    # The specifics of how you implement this are up to you.
    # Hint 1: remember that a puzzle can only be extended by assigning a value
    #         to an unassigned variable.
    # Hint 2: remember that our expression tree only supports addition,
    #         multiplication, and non-negative integers.
    def fail_fast(self) -> bool:
        """
        Return True if this ExpressionTreePuzzle can be quickly determined to
        have no solution, False otherwise.
        >>> exp_t = ExprTree('+', [ExprTree('a', []), ExprTree('b', [])])
        >>> puz = ExpressionTreePuzzle(exp_t, 7)
        >>> puz.variables['a'] = 9
        >>> print(puz.variables)
        {'a': 9, 'b': 0}
        >>> p1 = puz.extensions()[0]
        >>> p1._tree.eval(p1.variables)
        10
        >>> p2 = puz.extensions()[8]
        >>> p2._tree.eval(p2.variables)
        18
        """
        # temp = []
        # ext = self.extensions()
        # # while ext != []:
        # while ext is not None:
        #     for item in ext:
        #         if item._tree.eval(item.variables) == item.target:
        #             return False
        #         temp.extend(item.extensions())
        #     ext = temp
        # return True
        ext = self.extensions()
        if not ext:
            return not self.is_solved()
        for exp_p in ext:
            if exp_p.is_solved():
                return False
            # there are unassigned variables
            if exp_p._tree.eval(exp_p.variables) >= exp_p.target:
                return True
            if not exp_p.is_solved() and exp_p._unassigned():
                return False
        return True


if __name__ == "__main__":
    import python_ta

    python_ta.check_all(config={'pyta-reporter': 'ColorReporter',
                                'allowed-io': [],
                                'allowed-import-modules': ['doctest',
                                                           'python_ta',
                                                           'typing',
                                                           '__future__',
                                                           'expression_tree',
                                                           'puzzle'],
                                'disable': ['E1136'],
                                'max-attributes': 15}
                        )
