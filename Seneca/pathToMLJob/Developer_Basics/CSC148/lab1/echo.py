import math
import calendar
from typing import List


def remove_neg(num_list: List[float]) -> None:
    """Remove the negative numbers from the list num_list.
    >>> numbers = [-5, 1, -3, 2]
    >>> remove_neg(numbers)
    >>> numbers
    [1, 2]
    >>> numbers1 = [1, 2, 3, -3, 6, -1, -3, 1]
    >>> remove_neg(numbers1)
    >>> numbers1
    [1, 2, 3, 6, 1]
    """
    for item in num_list[::-1]:
        if item < 0:
            # remove and shift one item forward
            # thus use the reverse ordered copy of list
            num_list.remove(item)


if __name__ == '__main__':
    # help(calendar)
    print(dir(calendar))
    print(math.pi.__doc__)
    print(math.erf.__doc__)
    print("__name__ is ", __name__)
    print(math.floor(-2.8))
    print(math.floor(2.8))
    print(int(2.8))
    print(int(-2.8))
    # values = [1, 2, 3]
    # print(values)
    # values[1] = values
    # print(values)
    # print(len(values[1][1]))
    import doctest
    doctest.testmod()

    numbers2 = [1, 2, 3, -3, 6, -1, -3, 1]
    print(numbers2[::-1])

    for i in range(1, 8):
        print('T' * i)
    i: int = 1
    j: int = 0
    while i < 1.25:
        i *= 1.04
        j += 1
    print(j)

