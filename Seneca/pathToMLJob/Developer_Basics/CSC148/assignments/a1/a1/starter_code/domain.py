"""Assignment 1 - Domain classes (Task 2)

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

This module contains the classes required to represent the entities
in the simulation: Parcel, Truck and Fleet.
"""
from typing import List, Dict
from distance_map import DistanceMap


class Parcel:
    """A parcel should be delivered to destination from the depot city

    === Public Attributes ===
    parcel_id: a unique id of parcel
    volume: the space this parcel will use
    depot: the start city of this parcel
    destination: the destination

    === Private Attributes ===

    """
    parcel_id: int
    volume: int
    depot: str
    destination: str
    # TODO: Implement this class!
    # It must be consistent with the Fleet class docstring examples below.

    def __init__(self, parcel_id: int, volume: int, depot: str, dest: str) -> \
            None:
        """ create a parcel ready to be packed and delivered

        >>> p1 = Parcel(1, 5, 'Buffalo', 'Hamilton')
        """
        self.parcel_id = parcel_id
        self.volume = volume
        self.depot = depot
        self.destination = dest


class Truck:
    # TODO: Implement this class!
    # It must be consistent with the Fleet class docstring examples below.
    """ A truck carrying deliveries

    === Public Attributes ===
    truck_id: a unique ID of this truck
    capacity: total available volume
    depot: the start city of this truck
    load: used capacity, quantify
    route: an ordered list of city names that it is scheduled to travel through
    parcels: a list of id of parcels packed onto this truck

    === Private Attributes ===
    """
    truck_id: int
    capacity: int
    depot: str
    load: int
    route: List[str]
    parcels: List[int]

    def __init__(self, truck_id: int, capacity: int, depot: str) -> None:
        """Create a truck can carry parcel

        >>> t = Truck(1423, 1000, 'Toronto')
        """
        self.truck_id = truck_id
        self.capacity = capacity
        self.depot = depot
        self.route = []
        self.load = 0
        self.parcels = []

    def pack(self, parcel: Parcel) -> bool:
        """Load parcel to the truck and upate truck load, route

        >>> t2 = Truck(1333, 10, 'Toronto')
        >>> p2 = Parcel(2, 5, 'Toronto', 'Hamilton')
        >>> t2.pack(p2)
        True
        # >>> from distance_map import DistanceMap
        # >>> m = DistanceMap()
        # >>> m.add_distance('Toronto', 'Hamilton', 9)
        # >>> t2.distance_travel(m)
        # 18
        """
        if self.available_vol() >= parcel.volume:
            self.load += parcel.volume
            self.parcels.append(parcel.parcel_id)
            if self.depot == parcel.depot:
                self.route.append(parcel.destination)
            else:
                # self.route.append(parcel.depot)
                self.route.append(parcel.destination)
            return True
        return False

    def fullness(self) -> float:
        """obtain the measurement for the fullness of the truck
        """
        return 100 * (self.load / self.capacity)

    def __str__(self) -> str:
        """Produce a string representation of this truck

        >>> t = Truck(1423, 1000, 'Toronto')
        >>> print(t)
        Truck: 1423, capacity: 1000, Depot: Toronto.
        """
        return 'Truck: {}, capacity: {}, Depot: {}.'.format(self.truck_id,
                                                            self.capacity,
                                                            self.depot)

    def available_vol(self) -> int:
        """return unused volume of this truck
        """
        return self.capacity - self.load

    def distance_travel(self, dmap: DistanceMap) -> int:
        """helper function, all distance travelled by this truck, deliver
        then go back to depot

        >>> t2 = Truck(1333, 10, 'Toronto')
        >>> p2 = Parcel(2, 5, 'Toronto', 'Hamilton')
        >>> t2.pack(p2)
        True
        # >>> from distance_map import DistanceMap
        # >>> m = DistanceMap()
        # >>> m.add_distance('Toronto', 'Hamilton', 9)
        # >>> t2.distance_travel(m)
        # 18
        """
        if len(self.route) == 0:
            return 0
        d = dmap.distance(self.depot, self.route[0])
        for i in range(1, len(self.route)):
            d += dmap.distance(self.route[i - 1], self.route[i])
        d += dmap.distance(self.route[-1], self.depot)
        return d


class Fleet:
    """ A fleet of trucks for making deliveries.

    ===== Public Attributes =====
    trucks:
      List of all Truck objects in this fleet.
    """
    trucks: List[Truck]

    def __init__(self) -> None:
        """Create a Fleet with no trucks.

        >>> f = Fleet()
        >>> f.num_trucks()
        0
        """
        # TODO: Complete this method.
        # for truck in trucks:
        # self.trucks.append(truck)
        self.trucks = []

    def add_truck(self, truck: Truck) -> None:
        """Add <truck> to this fleet.

        Precondition: No truck with the same ID as <truck> has already been
        added to this Fleet.

        >>> f = Fleet()
        >>> t = Truck(1423, 1000, 'Toronto')
        >>> f.add_truck(t)
        >>> f.num_trucks()
        1
        """
        # TODO: Complete this method.
        self.trucks.append(truck)

    # We will not test the format of the string that you return -- it is up
    # to you.
    def __str__(self) -> str:
        """Produce a string representation of this fleet

        >>> f = Fleet()
        >>> t = Truck(1423, 1000, 'Toronto')
        >>> f.add_truck(t)
        >>> print(f)
        Truck: 1423, capacity: 1000, Depot: Toronto.
        """
        # TODO: Complete this method.
        tmp = []
        for truck in self.trucks:
            tmp.append(str(truck))
        return ' '.join(tmp)

    def num_trucks(self) -> int:
        """Return the number of trucks in this fleet.

        >>> f = Fleet()
        >>> t1 = Truck(1423, 10, 'Toronto')
        >>> f.add_truck(t1)
        >>> f.num_trucks()
        1
        """
        # TODO: Complete this method.
        return len(self.trucks)

    def num_nonempty_trucks(self) -> int:
        """Return the number of non-empty trucks in this fleet.

        >>> f = Fleet()
        >>> f.num_nonempty_trucks()
        0
        >>> t1 = Truck(1423, 10, 'Toronto')
        >>> f.add_truck(t1)
        >>> p1 = Parcel(1, 5, 'Buffalo', 'Hamilton')
        >>> t1.pack(p1)
        True
        >>> p2 = Parcel(2, 4, 'Toronto', 'Montreal')
        >>> t1.pack(p2)
        True
        >>> t1.fullness()
        90.0
        >>> t2 = Truck(5912, 20, 'Toronto')
        >>> f.add_truck(t2)
        >>> p3 = Parcel(3, 2, 'New York', 'Windsor')
        >>> t2.pack(p3)
        True
        >>> t2.fullness()
        10.0
        >>> t3 = Truck(1111, 50, 'Toronto')
        >>> f.add_truck(t3)
        >>> f.num_nonempty_trucks()
        2
        """
        # TODO: Complete this method.
        counter = 0
        for truck in self.trucks:
            if truck.load > 0:
                counter += 1
        return counter

    def parcel_allocations(self) -> Dict[int, List[int]]:
        """Return a dictionary in which each key is the ID of a truck in this
        fleet and its value is a list of the IDs of the parcels packed onto it,
        in the order in which they were packed.

        >>> f = Fleet()
        >>> t1 = Truck(1423, 10, 'Toronto')
        >>> p1 = Parcel(27, 5, 'Toronto', 'Hamilton')
        >>> p2 = Parcel(12, 5, 'Toronto', 'Hamilton')
        >>> t1.pack(p1)
        True
        >>> t1.pack(p2)
        True
        >>> t2 = Truck(1333, 10, 'Toronto')
        >>> p3 = Parcel(28, 5, 'Toronto', 'Hamilton')
        >>> t2.pack(p3)
        True
        >>> f.add_truck(t1)
        >>> f.add_truck(t2)
        >>> f.parcel_allocations() == {1423: [27, 12], 1333: [28]}
        True
        """
        # TODO: Complete this method.
        fleet_parcels = {}
        for truck in self.trucks:
            fleet_parcels[truck.truck_id] = truck.parcels
        return fleet_parcels

    def total_unused_space(self) -> int:
        """Return the total unused space, summed over all non-empty trucks in
        the fleet.
        If there are no non-empty trucks in the fleet, return 0.

        >>> f = Fleet()
        >>> f.total_unused_space()
        0
        >>> t = Truck(1423, 1000, 'Toronto')
        >>> p = Parcel(1, 5, 'Buffalo', 'Hamilton')
        >>> t.pack(p)
        True
        >>> f.add_truck(t)
        >>> f.total_unused_space()
        995
        """
        # TODO: Complete this method.
        if self.num_nonempty_trucks() == 0:
            return 0
        all_unused_space = 0
        for truck in self.trucks:
            if truck.load > 0:
                all_unused_space += truck.capacity - truck.load
        return all_unused_space

    def _total_fullness(self) -> float:
        """Return the sum of truck.fullness() for each non-empty truck in the
        fleet. If there are no non-empty trucks, return 0.

        >>> f = Fleet()
        >>> f._total_fullness() == 0.0
        True
        >>> t = Truck(1423, 10, 'Toronto')
        >>> f.add_truck(t)
        >>> f._total_fullness() == 0.0
        True
        >>> p = Parcel(1, 5, 'Buffalo', 'Hamilton')
        >>> t.pack(p)
        True
        >>> f._total_fullness()
        50.0
        """
        # TODO: Complete this method.
        if not self.num_nonempty_trucks():
            return float(0)
        total_fullness = 0
        for truck in self.trucks:
            total_fullness += truck.fullness()
        return total_fullness

    def average_fullness(self) -> float:
        """Return the average percent fullness of all non-empty trucks in the
        fleet.

        Precondition: At least one truck is non-empty.

        >>> f = Fleet()
        >>> t = Truck(1423, 10, 'Toronto')
        >>> p = Parcel(1, 5, 'Buffalo', 'Hamilton')
        >>> t.pack(p)
        True
        >>> f.add_truck(t)
        >>> f.average_fullness()
        50.0
        """
        # TODO: Complete this method.
        return self._total_fullness() / self.num_nonempty_trucks()

    def total_distance_travelled(self, dmap: DistanceMap) -> int:
        """Return the total distance travelled by the trucks in this fleet,
        according to the distances in <dmap>.

        Precondition: <dmap> contains all distances required to compute the
                      average distance travelled.

        >>> f = Fleet()
        >>> t1 = Truck(1423, 10, 'Toronto')
        >>> p1 = Parcel(1, 5, 'Toronto', 'Hamilton')
        >>> t1.pack(p1)
        True
        >>> t2 = Truck(1333, 10, 'Toronto')
        >>> p2 = Parcel(2, 5, 'Toronto', 'Hamilton')
        >>> t2.pack(p2)
        True
        # >>> from distance_map import DistanceMap
        # >>> m = DistanceMap()
        # >>> m.add_distance('Toronto', 'Hamilton', 9)
        # >>> f.add_truck(t1)
        # >>> f.add_truck(t2)
        # >>> f.total_distance_travelled(m)
        # 36
        """
        # TODO: Complete this method.
        total_d = 0
        for truck in self.trucks:
            total_d += truck.distance_travel(dmap)
        return total_d

    def average_distance_travelled(self, dmap: DistanceMap) -> float:
        """Return the average distance travelled by the trucks in this fleet,
        according to the distances in <dmap>.

        Include in the average only trucks that have actually travelled some
        non-zero distance.

        Preconditions:
        - <dmap> contains all distances required to compute the average
          distance travelled.
        - At least one truck has travelled a non-zero distance.

        >>> f = Fleet()
        >>> t1 = Truck(1423, 10, 'Toronto')
        >>> p1 = Parcel(1, 5, 'Toronto', 'Hamilton')
        >>> t1.pack(p1)
        True
        >>> t2 = Truck(1333, 10, 'Toronto')
        >>> p2 = Parcel(2, 5, 'Toronto', 'Hamilton')
        >>> t2.pack(p2)
        True
        # >>> from distance_map import DistanceMap
        # >>> m = DistanceMap()
        # >>> m.add_distance('Toronto', 'Hamilton', 9)
        # >>> f.add_truck(t1)
        # >>> f.add_truck(t2)
        # >>> f.average_distance_travelled(m)
        # 18.0
        """
        # TODO: Complete this method.
        counter = 0
        for truck in self.trucks:
            if truck.distance_travel(dmap) > 0:
                counter += 1
        return self.total_distance_travelled(dmap) / counter


if __name__ == '__main__':
    import python_ta
    python_ta.check_all(config={
        'allowed-import-modules': ['doctest', 'python_ta', 'typing',
                                   'distance_map'],
        'disable': ['E1136'],
        'max-attributes': 15,
    })
    import doctest
    doctest.testmod()
