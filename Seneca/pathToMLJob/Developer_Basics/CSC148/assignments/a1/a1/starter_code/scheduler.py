"""Assignment 1 - Scheduling algorithms (Task 4)

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

This module contains the abstract Scheduler class, as well as the two
subclasses RandomScheduler and GreedyScheduler, which implement the two
scheduling algorithms described in the handout.
"""
from typing import List, Dict, Union
from random import shuffle
from container import PriorityQueue
from domain import Parcel, Truck


class Scheduler:
    """A scheduler, capable of deciding what parcels go onto which trucks, and
    what route each truck will take.

    This is an abstract class.  Only child classes should be instantiated.
    """

    def schedule(self, parcels: List[Parcel], trucks: List[Truck],
                 verbose: bool = False) -> List[Parcel]:
        """Schedule the given <parcels> onto the given <trucks>, that is, decide
        which parcels will go on which trucks, as well as the route each truck
        will take.

        Mutate the Truck objects in <trucks> so that they store information
        about which parcel objects they will deliver and what route they will
        take.  Do *not* mutate the list <parcels>, or any of the parcel objects
        in that list.

        Return a list containing the parcels that did not get scheduled onto any
        truck, due to lack of capacity.

        If <verbose> is True, print step-by-step details regarding
        the scheduling algorithm as it runs.  This is *only* for debugging
        purposes for your benefit, so the content and format of this
        information is your choice; we will not test your code with <verbose>
        set to True.
        """
        raise NotImplementedError


# TODO: Implement classes RandomScheduler and GreedyScheduler.
class RandomScheduler(Scheduler):
    """Allocating random parcels to random trucks

    """
    def schedule(self, parcels: List[Parcel], trucks: List[Truck],
                 verbose: bool = False) -> List[Parcel]:
        """Carry out random schedule

        """
        # or directly shuffle(parcels)
        p_index = list(range(len(parcels)))
        shuffle(p_index)
        # directly shuffle trucks
        shuffle(trucks)
        left_over = []
        for i in p_index:
            p = parcels[i]
            pack_flag = False
            for truck in trucks:
                if truck.pack(p):
                    pack_flag = True
                    if verbose:
                        print(str(p.parcel_id) + ' packed onto ' + str(
                            truck.truck_id))
                    # pack_flag = True
                    break
            if not pack_flag:
                left_over.append(p)
                if verbose:
                    print(str(p.parcel_id) + ' is left over.')
                # left_over.append(p)
        return left_over


class GreedyScheduler(Scheduler):
    """Allocating prioritized parcels to prioritized truck, using greedy
    algorithm

    === Private Attributes ===
    _config: a dictionary
    """
    _config: Dict[str, Union[str, bool]]

    def __init__(self, config: Dict[str, Union[str, bool]]) -> None:
        self._config = config

    def schedule(self, parcels: List[Parcel], trucks: List[Truck],
                 verbose: bool = False) -> List[Parcel]:
        """Carry out greedy schedule algorithm, parcels will be reordered,
        then packed to pre-ordered eligible truck

        """
        parcel_priority = self._config['parcel_priority']
        parcel_order = self._config['parcel_order']
        truck_order = self._config['truck_order']
        verbose = self._config['verbose']
        # setup priority queue based on above options
        if parcel_priority == 'volume':
            if parcel_order == 'non-increasing':
                parcel_priority_q = PriorityQueue(_parcel_volume_less)
            else:
                parcel_priority_q = PriorityQueue(_parcel_volume_larger)
        else:
            if parcel_order == 'non-increasing':
                parcel_priority_q = PriorityQueue(_parcel_city2_alpha_larger)
            else:
                parcel_priority_q = PriorityQueue(_parcel_city2_alpha_less)
        # setup the truck priority queue
        if truck_order == 'non-increasing':
            truck_priority_q = PriorityQueue(_truck_available_vol_larger)
        else:
            truck_priority_q = PriorityQueue(_truck_available_vol_less)
        # get ordered parcel based on config
        for p in parcels:
            parcel_priority_q.add(p)
        # return leftover parcels
        left_over = []
        while not parcel_priority_q.is_empty():
            # dequeue parcel, from the end
            parcel = parcel_priority_q.remove()
            # for this parcel, get eligible trucks first
            good_trucks = _route_eligible_trucks(parcel, trucks)
            # if no eligible trucks, then left over
            if not good_trucks:
                if verbose:
                    print(str(parcel.parcel_id) + ' was not packed.')
                left_over.append(parcel)

            else:
                # then order trucks by available volume
                for truck in good_trucks:
                    truck_priority_q.add(truck)
                # then pop out the highest priority truck for this parcel
                best_truck = truck_priority_q.remove()
                pack_flag = best_truck.pack(parcel)
                # clear the queue of truck
                while not truck_priority_q.is_empty():
                    truck_priority_q.remove()

                # verbose and packed is true
                if verbose and pack_flag:
                    print(str(best_truck.truck_id) + ' got parcel ' + str(
                        parcel.parcel_id))

        return left_over


def _eligible_trucks(parcel: Parcel, trucks: List[Truck]) -> List[
        Truck]:
    """Return a list of trucks which can carry this parcel

    """
    tmp = []
    for truck in trucks:
        if truck.available_vol() >= parcel.volume:
            tmp.append(truck)

    return tmp


def _route_eligible_trucks(parcel: Parcel, trucks: List[Truck]) -> List[
        Truck]:
    # using parent class method, get truck with enough volume
    trucks_tmp = _eligible_trucks(parcel, trucks)
    # 2nd filter
    route_match_trucks = []
    for truck in trucks_tmp:
        if len(truck.route) != 0 and parcel.destination == truck.route[-1]:
            route_match_trucks.append(truck)
    if not route_match_trucks:
        return trucks_tmp
    else:
        return route_match_trucks


def _parcel_volume_larger(p1: Parcel, p2: Parcel) -> bool:
    """True if p1 use more volume than p2

    """
    return p1.volume > p2.volume


def _parcel_volume_less(p1: Parcel, p2: Parcel) -> bool:
    """True if p1 use less volume than p2

    """
    return p1.volume < p2.volume


def _parcel_city2_alpha_larger(p1: Parcel, p2: Parcel) -> bool:
    """True if the destination of p1 is larger than p2, alphabetically

    """
    return p1.destination > p2.destination


def _parcel_city2_alpha_less(p1: Parcel, p2: Parcel) -> bool:
    """True if the destination of p1 is smaller than p2, alphabetically

    """
    return p1.destination < p2.destination


def _truck_available_vol_larger(t1: Truck, t2: Truck) -> bool:
    """Return true if the available volume of t1 is greater than t2

    """
    return t1.available_vol() > t2.available_vol()


def _truck_available_vol_less(t1: Truck, t2: Truck) -> bool:
    """Return true if the available volume of t1 is less than t2

    """
    return t1.available_vol() < t2.available_vol()


if __name__ == '__main__':
    import doctest
    doctest.testmod()

    import python_ta
    python_ta.check_all(config={
        'allowed-io': ['compare_algorithms'],
        'allowed-import-modules': ['doctest', 'python_ta', 'typing',
                                   'random', 'container', 'domain'],
        'disable': ['E1136'],
        'max-attributes': 15,
    })
