"""Race Registry
=============Context: a system for organizing a 5K running race.
When runners register for a race, they provide their name, email address and their speed category.
A speed category indicates how quickly they estimate that they can finish the race.

This allows organizers to start the runners in groups of roughly equivalent running speed so that faster runners
aren't stuck behinds lower runners.
The possible speed categories are: under 20 minutes, under 30minutes, under 40 minutes, and 40 minutes or over. We
need to be able get a list of runners in a given speed category.
We also need to be able to look up a runner to find their speed category. Finally, a runner should be able to
change their email address and speed category, or withdraw from the race entirely.
"""
from typing import List, Dict, Optional


class Runner:
    """ A runner for a race

    === Attributes ===
    name: the name of this player.
    email: the email address
    speed: the speed type

    === Private Attributes ===


    === Representation Invariants ===
    - Speed belongs to given categories, including '-20', '20-30', '30-40', '40-'.

    === Sample Usage ===

    >>> Gerhard = Runner("Gerhard", "Gerhard@gmail.com", "30-40")
    """
    name: str
    email: str
    speed: str

    def __init__(self, name: str, email: str, speed: str) -> None:
        """Initialize the runner

        :param name: the name of the runner
        :param email: email address
        :param speed: speed category
        """
        self.name = name
        self.email = email
        self.speed = speed

    def __str__(self) -> str:
        """Return a string representing this runner

        >>> Gerhard = Runner("Gerhard", "Gerhard@gmail.com", "30-40")
        >>> print(Gerhard)
        The runner: Gerhard
        Email: Gerhard@gmail.com
        Speed category(min): 30-40
        """
        return 'The runner: {}\nEmail: {}\nSpeed category(min): {}'.\
            format(self.name, self.email, self.speed)

    def update_email(self, email: str) -> None:
        self.email = email

    def update_speed(self, speed: str) -> None:
        self.speed = speed


class Race:
    """ A race let runners to compete

    === Attributes ===
    runner_list: a dictionary of runners with different speed categories.

    === Private Attributes ===
    _speed_category: a predefined list of speed categories

    === Sample Usage ===
    >>> a_race = Race()
    >>> Gerhard = Runner("Gerhard", "Gerhard@gmail.com", "30-40")
    >>> Tom = Runner("Tom", "Tom@gmail.com", "20-30")
    >>> Toni = Runner("Toni", "Toni@gmail.com", "-20")
    >>> Margot = Runner("Margot", "Margot@gmail.com", "20-30")
    >>> a_race.register_runner(Gerhard)
    True
    >>> a_race.register_runner(Tom)
    True
    >>> a_race.register_runner(Toni)
    True
    >>> a_race.register_runner(Margot)
    True

    """
    runner_list: Dict[str, List]
    _speed_category: List[str]

    def __init__(self) -> None:
        """Initialize this race class

        """
        self.runner_list = {key: [] for key in ['-20', '20-30', '30-40', '40-']}
        self._speed_category = ['-20', '20-30', '30-40', '40-']

    def register_runner(self, runner: Runner) -> bool:
        """Add runner to self.runner_list

        :param runner:
        :return:
        """
        if runner.name and runner.email:
            temp_dict = {runner.name: runner.email}
            if runner.speed in self._speed_category:
                self.runner_list[runner.speed].append(temp_dict)
                return True

            return False
        return False

    def remove_runner(self, runner: Runner) -> Optional[bool]:
        """remove a runner by name

        """
        temp_dict = {runner.name: runner.email}
        for speed in self._speed_category:
            if temp_dict in self.runner_list[speed]:
                self.runner_list[speed].remove(temp_dict)
                return True
        return None

    def update_runner(self, runner: Runner) -> None:
        """Change runner info in self.runner_list

        :param runner:
        :return:
        """
        self.remove_runner(runner)
        self.register_runner(runner)

    def report_by_speed(self, speed: str) -> List:
        """Return a list of runners in certain speed category.

        >>> a_race = Race()
        >>> Gerhard = Runner("Gerhard", "Gerhard@gmail.com", "30-40")
        >>> a_race.register_runner(Gerhard)
        True
        """
        return self.runner_list[speed]


if __name__ == '__main__':

    test1 = Runner("test1", "test1@gmail.com", "30-40")
    print(test1)
    a_race_test = Race()
    a_race_test.register_runner(test1)
    print(a_race_test.report_by_speed('30-40'))

    import doctest
    doctest.testmod()

    import python_ta
    python_ta.check_all()
