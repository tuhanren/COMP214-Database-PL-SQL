########## format string ############
# use % modulo format 
total = 1000000
target = "house"
unitPrice = 1454.3
print("We have $%.2E to buy a %s, while the unit price of %s is %.2f" % (total, target, target, unitPrice))

# Use .format() string format
# a list of tuple
dt = [(2,10), (23,14), (15,25)]
print("coordinate x | coordinate y | ")
for x, y in dt:
    # prepare a template using .format 
    sTemplate = "The X: {x:6.2f}| The Y: {y:6.2f}| The radius: {distance:6.2f}"
    print( sTemplate.format( x = x,y = y, distance = (x**2 + y**2)**(1/2) ) )
     
print("-"*45)
# the same as the following
for x, y in dt:
    # prepare a template using .format 
    # sign (<) indicates that the output is left-justified
    # <fill> - specifies how to fill in extra space 
    print( "The X: {x:-<6.2f}| The Y: {y:<6.2f}| The radius: {distance:<6.2f}".format( x = x,y = y, distance = (x**2 + y**2)**(1/2) ) ) 

# the percentage
print("{:.2%}".format(0.65))
# the group format such as 1,000,000
print("This is grouped number {:,.4f}".format(1243154135.913))

# the f-string literal 
# the string interpolation
#  embed Python expressions directly inside them
print("coordinate x | coordinate y | (x**2 + y**2)**(1/2)")
for x, y in dt:
    print(f" X: {x:>6.2f}| Y: {y:>6.2f}| Distance: {(x**2 + y**2)**0.5:>7.3f}")

