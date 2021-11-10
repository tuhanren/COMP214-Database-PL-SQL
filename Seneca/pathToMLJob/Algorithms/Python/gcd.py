#Redo GCD 
# only for positive integer
def findGCD(a, b):
    # we have denominator, numerator and remainder
    # this part is not necessary the smaller number will become the remainder if it act as numerator 
    # if (a < b):
    #     d = a; n = b
    # else:
    #     n = a; d = b
    n = a; d = b
    while d >= 1:
        # calculate remainder
        r = n%d
        if (r == 0):
    # return
            return print(f"The greatest common denominator for {a} and {b} is {d}.")
        else:
        # key points of this algorithm
        # the bigger number is n = kd + r
        # if d == lr then n must be klr + r 
        # thus we only need to test if d == lr, 
        # all character represents an integer
            n = d
            d = r

findGCD(6, 26)
findGCD(60, 96)

print(6%20)
print("%.1e" % 1000)

# compare with the answer
def gcd(a, b):
    # the key diff is the condition in while
    while b != 0:
        tmp = a
        a = b
        b = tmp%b
    # if b == 0 then the loop end
    return a 

print(gcd(60, 96))