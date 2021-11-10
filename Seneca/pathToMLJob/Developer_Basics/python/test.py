# #Only use semicolon when put multiple commands in one line.
# name = input('Hi! May I have your name please?\n');  age = int(input('Now tell me how old are you?\n'))
# print('You are', name, age, 'years old.\n')

# # test
# print("Hello World!")

# print("Goodbye world!")S

#arithmetic operators
print('The // operator, floor division')
print(18/5, "VS.", 18//5, '\n')

print('Get the remainder of division')
print(18%5, 'VS.', 15%5)

## assignment operator
y = 4
a = 2

# similar logic as //= %=
y **= 2
print(y)

print(type(y))

# keyword list
import keyword

print(keyword.kwlist)


# conditional statement 
plant = "Cacti"

# plant = "Irises"

if plant == "Cacti":
    print(plant, "don't need a lot of water")
else:
    print(plant, "love water")

print("Thanks!")

# guessing game

favorite_food = "tofu"

# guess_food = input("What's my favorite food?")

# if guess_food == favorite_food:
#     print("Yep! So amazing!")
# else:
#     print("Yuck! That's not it!")

# print("Thanks for playing!")
# # input take number as string
# print(input("Enter a number: "))

# function 
def say_hello():
    print("Hello, friends!")

say_hello()

def wash_car(amount_paid):
    if (amount_paid == 12):
        print("""
        Wash with tri-color foam
        Rinse twice
        Dry with large blow dryer
        """)
    if (amount_paid == 6):
        print("""
        Wash with white foam
        Rinse once
        Air dry
        """)

wash_car(12)

def withdraw_money(current_balance, amount):
    if (current_balance > amount):
        current_balance -= amount
    print("The balance is", current_balance)

withdraw_money(100, 80)

def favorite_city(name):
    print("My favorite city is:", name)

favorite_city("Toronto")

# list

cities = [
    'Tokyo',
    'Dakar'
]

print(cities)
# can have comma at the last or not
cities = [
    'Tokyo',
    'Dakar',
    "Mumbai",
    "Buenos Aires"
]

print(cities)

# dictionary

food = {
    "appetizer": "hummus",
    "entree":"gyro wraps",
    "dessert":"baklava"
}

print(food)
print(food["dessert"])

# tuple
# might be considered as immutable list
taco_no = ('qi', "wen","has", "no", "taco")

# create list
stars = ["Sol","Alpha Centauri","Barnard","Wolf 359",]
print(stars[3])

peaks = {
    "African":"Kilimanjaro",
    "Antarctic":"Vinson",
    "Australian":"Puncak Jaya",
    "Eurasian":"Everest"
}

print(peaks["Eurasian"])

# for loop
spices = [
    "salt",
    "pepper",
    "cumin",
    "turmeric",
]

for spice in spices:
    print(spice)

# iteration, custom end point
i = 5
while i <= 50:
    print(i)
    i += 5

fruits = [
    "apples",
    "bananas",
    "dragon fruit",
    "mangos",
    "nectarines",
    "pears",
]

for fruit in fruits:
    print(fruit)

# format print and multiply
def multiply(x,y):
    print(f"{x:.1f} * {y:.1f} = {x * y:.2f}")
multiply(6,3)
# test string format
# the first number before dot control the width of whole number, 
# here 3.142, including the space before the number, the total length is 5.
import math
print(f'The value of pi is approximately {math.pi:6.3f}.')  