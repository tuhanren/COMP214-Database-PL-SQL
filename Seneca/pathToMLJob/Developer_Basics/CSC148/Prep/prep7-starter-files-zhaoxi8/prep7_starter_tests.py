"""CSC148 Prep 7:

=== CSC148 Winter 2021 ===
Department of Computer Science,
University of Toronto

This code is provided solely for the personal and private use of
students taking the CSC148 course at the University of Toronto.
Copying for purposes other than this use is expressly prohibited.
All forms of distribution of this code, whether as given or with
any changes, are expressly prohibited.

Authors: Sophia Huynh

All of the files in this directory and all subdirectories are:
Copyright (c) 2021 Sophia Huynh

=== Module description ===
Complete the TODO in this file.

When writing a test case, make sure you create a new function, with its
name starting with "test_". For example:

def test_my_test_case():
    # Your test here
"""
from prep7 import contains_non_satisfier


def test_satisfier_corner():
    def p(n: int) -> bool:
        return n * (n + 1) * (n + 2) % 5 == 0
    assert contains_non_satisfier([5, 2, [15, 7], 9], p)
    assert contains_non_satisfier([5, 2, 9], p)
    assert not contains_non_satisfier([], p)
    assert contains_non_satisfier([0, 0, [0, 1], 0], p)
    assert contains_non_satisfier([0, [0], [0, [0, 1], 0], 0], p)
    assert contains_non_satisfier([[0], [0, [0, 1], 0]], p)
    assert not contains_non_satisfier([[0], [0, [0, 0], 0]], p)
    assert not contains_non_satisfier([5, 8, [15, 13], 9], p)

    def p(n: int) -> bool:
        return n < 10
    assert not contains_non_satisfier([], p)
    assert contains_non_satisfier([10], p)

    def p(n: int) -> bool:
        return abs(n) > 10
    assert not contains_non_satisfier([], p)

    def p(n: int) -> bool:
        return n > n - 1
    assert not contains_non_satisfier([], p)
    assert not contains_non_satisfier([1, 2], p)

    def p(n: int) -> bool:
        return n < n - 1
    assert not contains_non_satisfier([], p)
    assert not contains_non_satisfier([[], []], p)
    assert contains_non_satisfier([[1], [1]], p)

# While we have provided you a doctest in prep7.py, we will not be
# providing sample test cases this time. The tests you write should help you
# test your own code as well!


if __name__ == '__main__':
    import pytest
    pytest.main(['prep7_starter_tests.py'])
