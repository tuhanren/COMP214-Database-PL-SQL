"""A game player class

=== Module description ===
This module implements the player class
"""
from typing import List, Optional


class Player:
    """A game player such as PacMan or Tetris

    === Attributes ===
    name: the name of this player.

    === Private Attributes ===
    _score_history: a list of game scores.

    === Representation Invariants ===
    - Score >= 0
    - The capacity of _score_history is 100, for most recent games.
    - The most recent game scores are at the end of the _score_history list.

    === Sample Usage ===

    >>> p = Player('Your Name')
    >>> p.name
    'Your Name'
    >>> p.record_score([1, 2, 3, 4, 5])
    True
    >>> p.get_average_score(3)
    4.0
    >>> p.top_score()
    5

    """
    name: str
    _score_history: List[int]

    def __init__(self, name: str) -> None:
        """Initialize this player.

        Precondition: The size of the _score_history is 100.

        >>> c = Player('Your Name')
        >>> c.name
        'Your Name'
        """
        self.name = name
        self._score_history = []

    def record_score(self, score: List[int]) -> bool:
        """ Record scores into the _score_history of this player.

        """
        if len(score) > 100:
            return False
        elif len(self._score_history) + len(score) < 100:
            self._score_history.extend(score)
            return True
        else:
            n_extra = len(self._score_history) + len(score) - 100
            del self._score_history[:n_extra]
            self._score_history.extend(score)
            return True

    def top_score(self) -> Optional[int]:
        """

        :return:
        """
        if len(self._score_history) == 0:
            return None
        else:
            return max(self._score_history)

    def get_average_score(self, n: int) -> Optional[float]:
        """

        :param n: the most recent n games, n > 0.
        :return:
        """
        if len(self._score_history) < n:
            return None
        else:
            return sum(self._score_history[-abs(n):]) / abs(n)

    def check_score(self) -> List:
        """ Return the _score_history

        :return:
        """
        return self._score_history


if __name__ == '__main__':
    import doctest
    doctest.testmod()

    import python_ta
    python_ta.check_all()
