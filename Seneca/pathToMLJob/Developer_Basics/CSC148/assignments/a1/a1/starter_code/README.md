# class DistanceMap
1. All attributes must be private.

# class Parcel and class Truck
1. Design attributes, public classes
2. Parcel Attributes: unique ID, depot to destination, volume
3. Depot, a special city, where trucks start from and end with, 
   and all parcel start with.
4. Truck attributes: unique ID, volume capacity and a route, an 
   ordered list of city names that it is scheduled to travel through.
   
5. Truck routes: A truck’s route is determined as follows: When a 
   parcel is scheduled to be delivered by a truck, that parcel’s 
   destination is added to the end of the truck’s route, unless 
   that city is already the last destination on the truck’s route.
   so the order in which we pack parcels onto trucks is going to 
   matter.
   
# class PriorityQueue
1. Do not add any public or private attributes.

# other classes
1. Do not change interface. 
2. Do not add public attributes.
3. Can add private attributes. 
4. Can create private helper methods.

# Schedule Parcel
## Random algorithm

## Greedy algorithm

### Truck choice
1. It only considers trucks that have enough unused volume to add 
   the parcel.
   
2. Among these trucks, if there are any that already have the 
   parcel’s destination at the end of their route, only those 
   trucks are considered. Otherwise, all trucks that have enough 
   unused volume are considered.
   
#  Priority Queue

