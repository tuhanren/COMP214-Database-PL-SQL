# TODO: recursion way to do countdown
def countDown(num):
    # the breaking condition
    if (num == 0):
        print("Done!")
        #TODO: Do not forget use return to stop
        return
    else:
        print(num)
        # call the function itself
        countDown(num - 1)
        # TODO: not release the stack (exit the function countDown), until the return condition met. 
        # Exit countDown then print num from call stack 
        print(num)

countDown(5)

# TODO: use recursion to calculate power
def power(num, pwr):
    if pwr <= 0:
        return 1
    else:
        # TODO: use return 
        return num*power(num, pwr - 1)

print(power(5, 3))

# TODO: use recursion to calculate factorial
def factorial(num):
    if num <= 1:
        return 1
    else:
        # TODO: use return 
        return num*factorial(num - 1)

print(factorial(5))
print(factorial(0))