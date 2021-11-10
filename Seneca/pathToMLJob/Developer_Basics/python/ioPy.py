# TODO: sum two numbers in each line, take input
import sys
for line in sys.stdin:
    numArray = line.split()
    print(int(numArray[0]) + int(numArray[1]))

while True:
    try: 
        x,y = map(int, input().split())
        print(x + y)
    except:
        break


import sys
for line in sys.stdin:
    x, y, *rest = map(int, line.split())
    print(x + y)

# TODO: first line is the number of line for the next several lines
import sys
# the first number 
num = int(sys.stdin.readline().strip())
for i in range(num):
    m, n = map(int, sys.stdin.readline().strip().split())
    print(m + n)

#TODO: if either a number out of two is 0, then stop
import sys
for line in sys.stdin:
    x, y = map(int, line.split())
    if (x == 0) and (y==0):
        break
    else:
        print(x + y)

# TODO: the first number in each line is the size parameter
import sys
for line in sys.stdin:
    n, *rest = map(int, line.split())
    if n == 0:
        break
    else:
        sum = 0 
        for i in range(n):
            sum += rest[i]
        print(sum)

# TODO: sort string then join 
while True:
    try:
        lst = input().split(",")
        print(",".join(sorted(lst)))
    except:
        break