"""Assignment 1 - Distance map (Task 1)

CSC148, Winter 2021

This code is provided solely for the personal and private use of
students taking the CSC148 course at the University of Toronto.
Copying for purposes other than this use is expressly prohibited.
All forms of distribution of this code, whether as given or with
any changes, are expressly prohibited.

Authors: Diane Horton, Ian Berlott-Atwell, Jonathan Calver,
Sophia Huynh, Maryam Majedi, and Jaisie Sin.

All of the files in this directory and all subdirectories are:
Copyright (c) 2021 Diane Horton, Ian Berlott-Atwell, Jonathan Calver,
Sophia Huynh, Maryam Majedi, and Jaisie Sin.

===== Module Description =====

This module contains the class DistanceMap, which is used to store
and look up distances between cities. This class does not read distances
from the map file. (All reading from files is done in module experiment.)
Instead, it provides public methods that can be called to store and look up
distances.
"""
from typing import Dict, Tuple


class DistanceMap:
    """ A map has a list of start, destination and distance

    === Private Attributes ===
    _distances: a dictionary of all distances added to the map, a distance
    is between city1 and city2.
    """
    _distances: Dict[Tuple, int]

    def __init__(self) -> None:
        """Create the class DistanceMap with no distances

        >>> m = DistanceMap()
        """
        self._distances = {}

    def add_distance(self, city1: str, city2: str, d1: int, d2: int = 0) -> \
            None:
        """ Add city1, city2 and distance between them to map

        >>> m = DistanceMap()
        >>> m.add_distance('Toronto', 'Hamilton', 9)
        """
        self._distances[(city1, city2)] = d1
        if d2 == 0:
            self._distances[(city2, city1)] = d1
        else:
            self._distances[(city2, city1)] = d2

    def distance(self, city1: str, city2: str) -> int:
        """ return distance between cities, return -1 if not in map

        >>> m = DistanceMap()
        >>> m.add_distance('Toronto', 'Hamilton', 9)
        >>> m.distance('Toronto', 'Hamilton')
        9
        >>> m.distance('Toronto', 'London')
        -1
        """
        tmp_key = (city1, city2)
        if tmp_key in self._distances:
            return self._distances[tmp_key]

        return -1


if __name__ == '__main__':
    import python_ta
    python_ta.check_all(config={
        'allowed-import-modules': ['doctest', 'python_ta', 'typing'],
        'disable': ['E1136'],
        'max-attributes': 15,
    })
    import doctest
    doctest.testmod()
