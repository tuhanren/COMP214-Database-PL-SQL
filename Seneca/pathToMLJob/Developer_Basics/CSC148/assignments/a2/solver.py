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

This module contains the abstract Solver class and its two subclasses, which
find solutions to puzzles, step by step.
"""

from __future__ import annotations

from typing import List, Optional, Set

# You may remove this import if you don't use it in your code.
from adts import Queue

from puzzle import Puzzle


class Solver:
    """"
    A solver for full-information puzzles. This is an abstract class
    and purely provides the interface for our solve method.
    """

    # You may NOT change the interface to the solve method.
    # Note the optional parameter seen and its type.
    # Your implementations of this method in the two subclasses should use seen
    # to keep track of all puzzle states that you encounter during the
    # solution process.
    def solve(self, puzzle: Puzzle,
              seen: Optional[Set[str]] = None) -> List[Puzzle]:
        """
        Return a list of puzzle states representing a path to a solution of
        <puzzle>. The first element in the list should be <puzzle>, the
        second element should be a puzzle that is in <puzzle>.extensions(),
        and so on. The last puzzle in the list should be such that it is in a
        solved state.

        In other words, each subsequent item of the returned list should take
        the puzzle one step closer to a solution, which is represented by the
        last item in the list.

        Return an empty list if the puzzle has no solution.

        <seen> is either None (default) or a set of puzzle states' string
        representations, whose puzzle states can't be any part of the path to
        the solution.
        """
        raise NotImplementedError


# TODO (Task 2): implement the solve method in the DfsSolver class.
# Your solve method MUST be a recursive function (i.e. it must make
# at least one recursive call to itself)
# You may NOT change the interface to the solve method.
class DfsSolver(Solver):
    """"
    A solver for full-information puzzles that uses
    a depth first search strategy.
    """

    def solve(self, puzzle: Puzzle,
              seen: Optional[Set[str]] = None) -> List[Puzzle]:
        """
        Return a list of puzzle states representing a path to a solution of
        <puzzle>. The first element in the list should be <puzzle>, the
        second element should be a puzzle that is in <puzzle>.extensions(),
        and so on. The last puzzle in the list should be such that it is in a
        solved state.

        In other words, each subsequent item of the returned list should take
        the puzzle one step closer to a solution, which is represented by the
        last item in the list.

        Return an empty list if the puzzle has no solution.

        <seen> is either None (default) or a set of puzzle states' string
        representations, whose puzzle states can't be any part of the path to
        the solution.
        """
        order = [puzzle]
        if puzzle.fail_fast():
            return []
        if seen is not None and puzzle.__str__() in seen:
            return []
        if seen is not None:
            new_seen = seen | {puzzle.__str__()}
        else:
            new_seen = {puzzle.__str__()}
        if puzzle.is_solved():
            return order
        sub_trees = puzzle.extensions()
        for sub_tree in sub_trees:
            if sub_tree.__str__() in new_seen:
                continue
            new_order = self.solve(sub_tree, new_seen)
            order += new_order
            if order[-1].is_solved():
                break
        if order == [puzzle]:
            order = []
        return order

        # path = [puzzle]
        # # base
        # if seen is not None and str(puzzle) in seen:
        #     return []
        # if not seen:
        #     seen = {str(puzzle)}
        # else:
        #     seen.add(str(puzzle))
        # if puzzle.fail_fast():
        #     return []
        # if puzzle.is_solved():
        #     return path
        #     # return puzzle
        #
        # # all possible solutions on for the first step
        # first_filling = puzzle.extensions()
        # for tmp_puzzle in first_filling:
        #     # just like the first branch of the first sub level
        #     if str(tmp_puzzle) in seen or tmp_puzzle.fail_fast():
        #         seen.add(str(tmp_puzzle))
        #     else:
        #         # path.append(tmp_puzzle)
        #         seen.add(str(tmp_puzzle))
        #         path.extend(DfsSolver.solve(self, tmp_puzzle))
        #         return path
        #         # return DfsSolver.solve(self, tmp_puzzle)
        #
        # # fail at the 2nd level
        # if len(path) == 1:
        #     return path
        # # if all branches do not work
        # # backtracking ........
        # # if all tmp_puzzle do not work
        # # delete the puzzle from path, which is the last one
        # path.pop()
        # # one level upper of current puzzle
        # parent_puzzle = path.pop()
        # path.extend(self.solve(parent_puzzle))
        # return path


# def _back_tracking(path):


# TODO (Task 2): implement the solve method in the BfsSolver class.
# Hint: You may find a Queue useful here.
class BfsSolver(Solver):
    """"
    A solver for full-information puzzles that uses
    a breadth first search strategy.
    """

    def solve(self, puzzle: Puzzle,
              seen: Optional[Set[str]] = None) -> List[Puzzle]:
        """
        Return a list of puzzle states representing a path to a solution of
        <puzzle>. The first element in the list should be <puzzle>, the
        second element should be a puzzle that is in <puzzle>.extensions(),
        and so on. The last puzzle in the list should be such that it is in a
        solved state.

        In other words, each subsequent item of the returned list should take
        the puzzle one step closer to a solution, which is represented by the
        last item in the list.

        Return an empty list if the puzzle has no solution.

        <seen> is either None (default) or a set of puzzle states' string
        representations, whose puzzle states can't be any part of the path to
        the solution.
        """
        search_q = [puzzle]
        searched = []
        while search_q:
            point = search_q.pop(0)
            if seen is not None and point.__str__() in seen:
                continue
            if point not in searched:
                if point.is_solved():
                    searched.append(point)
                    target = searched[-1]
                    path = [target]
                    while target != searched[0]:
                        for search in searched:
                            if target in search.extensions():
                                target = search
                                path.append(search)
                                break
                    return path[::-1]
                else:
                    for sub_tree in point.extensions():
                        if sub_tree not in searched:
                            search_q.append(sub_tree)
                    searched.append(point)
        return search_q

        # # for the original puzzle
        # path = [puzzle]
        # # two naive seen
        # dfs_seen = _seen_copy(seen)
        # dfs_seen_none = _seen_copy(seen)
        # if puzzle.fail_fast():
        #     return []
        # if puzzle.is_solved():
        #     return path
        # if seen is not None and str(puzzle) in seen:
        #     return []
        # if not seen:
        #     seen = {str(puzzle)}
        # else:
        #     seen.add(str(puzzle))
        # # using queue to save extensions
        # solution = []
        # q = Queue()
        # for puz in puzzle.extensions():
        #     q.enqueue(puz)
        # while not q.is_empty():
        #     tmp_puzzle = q.dequeue()
        #     if tmp_puzzle.is_solved():
        #         solution.append(tmp_puzzle)
        #         break
        #     if str(tmp_puzzle) in seen or tmp_puzzle.fail_fast():
        #         seen.add(str(tmp_puzzle))
        #     else:
        #         seen.add(str(tmp_puzzle))
        #         for puz in tmp_puzzle.extensions():
        #             q.enqueue(puz)
        # # path.append(solution)
        # # return path
        # if not solution:
        #     return []
        # # dfs_seen_none
        # # force dfs to get the same solution of bfs
        # # using dfs to get the path of bfs
        # solver = DfsSolver()
        # dfs_path = solver.solve(puzzle, dfs_seen)
        # dfs_solution = dfs_path[-1]
        # # solution set for all solutions until the same
        # solution_set = set(str(dfs_solution))
        #
        # while dfs_solution != solution[0]:
        #     dfs_seen_tmp = _seen_copy(dfs_seen_none)
        #     if not dfs_seen_tmp:
        #         dfs_seen_tmp = solution_set.copy()
        #     else:
        #         dfs_seen_tmp = dfs_seen_tmp | solution_set.copy()
        #     dfs_path = solver.solve(puzzle, dfs_seen_tmp)
        #     dfs_solution = dfs_path[-1]
        #     solution_set.add(dfs_solution)
        #
        # return dfs_path


def _seen_copy(seen: Optional[Set[str]] = None) -> Optional[Set[str]]:
    """
    Return a shallow copy of seen
    >>> _seen_copy()
    >>> _seen_copy({'a'})
    {'a'}
    """
    if seen is None:
        dfs_seen = None
    else:
        dfs_seen = seen.copy()

    return dfs_seen


if __name__ == "__main__":
    import python_ta

    python_ta.check_all(config={'pyta-reporter': 'ColorReporter',
                                'allowed-io': [],
                                'allowed-import-modules': ['doctest',
                                                           'python_ta',
                                                           'typing',
                                                           '__future__',
                                                           'puzzle',
                                                           'adts'],
                                'disable': ['E1136'],
                                'max-attributes': 15}
                        )
