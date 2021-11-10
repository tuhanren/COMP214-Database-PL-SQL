import numpy as np
a = -3
# TODO: make a vector
vectorX = np.array([1,4,9])
vectorY = np.array([1,3,5])

# TODO: identity matrix 
# I3 = np.identity(3, dtype = float)
I3 = np.identity(3, dtype = int)
Zeros = np.zeros((3,3), dtype = int)
Ones = np.ones((2,3), dtype = int)

X = np.array([ [1,2,3], [4,5,6],[7,8,9] ])
Y = np.array([ [1,2,3], [2,5,6],[3,6,9] ])

print(I3)
print("\n")
print(Zeros)
print(Ones)
print(X)
print(Y)
# TODO: calculations

print(vectorX + vectorY)
print(np.dot(vectorX, vectorY))

# TODO: elementwise multiplication
print(vectorX*vectorY)

# TODO: use identity matrix with scalar
print(vectorX*I3*vectorY)
print(vectorX*vectorY*I3)

print("Important: insert Identity matrix in scalar matrix multiplication has the same result, eigenvalue equation!!")
print(a*I3)
print(a*X)
# TODO: matrix multiplication 
print(np.dot(a*I3 ,X))

# TODO: linear equation system Ax = b
# TODO: the numpy array is by row vector
A = np.array([[0, 5, 1], [-2, 1, -4], [1, 6, 0]])
# TODO: make this a column vector, 2 by 1
b = np.array([[3], [7]])
invA = np.linalg.inv(A)
print(invA)
x = np.dot(invA, b)
print(x)

# TODO: use plu decomposition for any square matrix
# PLU decomposition used to solve linear system
from scipy.linalg import lu
import numpy as np
B = np.array([[ 0, 0, 1], [0, 2, 2], [3, 0, 4]])
# PLU
# P is column permutation of I, L is lower triangular matrix with unit element on diagonal, U is the row echolon form of B
P, L, U = lu(B)
print(P)
print(L)
print(U)
# outputs true
np.allclose(np.dot(np.dot(P,L), U), B)
# assert(np.allclose(((P@L)@U), B))
# TODO: matrix multiplication using @
np.allclose(((P@L)@U), B)
print(np.dot(np.dot(P,L), U))

# TODO: higher dimension of arrays, 
b = np.ones([2,3,4])
c = np.ones([2,4,3])
# a = np.ones([9, 5, 3, 4])
print(b)
print(c)

# TODO: multiplication of higher dimension array
np.matmul(b, c).shape
print(np.matmul(b, c))

X = np.array([ [1,5,2,1], [2,3,1,2],[-1,2,0,4], [2,3,-2,1] ])
Y = np.array([ [3,0,2,2], [0,1,1,0],[2,1,9,-1],[2,0,-1,4] ])
print(X)
print(Y)
print(np.matmul(X, Y))

# sum_of_elements is 10
sum_of_elements = np.sum(X)
print(sum_of_elements)

k = -9
print( np.abs(k) ) #abs_k is 9

# random matrix of size 4x4 with values from -15 to 15
m1 = np.random.randint(low=-15,high=15, size=(4, 4))
print(m1)
#replace all values that are greater than 0 with 1
# TODO: np.where is condition, then, else 
newM1 = np.where(m1 < 0, m1, 1) 
print(newM1)

# TODO: create empty np array
testN = np.array([])
print(testN)

# np.identity(6)
lst1 = [2,3,4,5,6]
lst1[0:3]

lst1 = [5,6,7,8,9,10]

lst2 = [5,6,7,8,9,10]


list(set(lst1 + lst2))

set([i for i in lst1 or lst2])

[i for i in set(lst1 + lst2)]

for i in lst2:
    if i not in lst1:
        lst1.append(i)

lst1

d = {"a" :1, "b": 2}
for value in d:
    print(value)
d = {"a" :1, "b": 2}
sum = 0
for key in d:
    sum += d[key]
print("The sum is: ", sum)





        # row =  
        
        # def combineLst(row1, row2):
        #     """
        #     j: location index int 
        #     arrS: sorted
        #     """
        #     arrS = []
        #     for j in range(len(row1)):
                
        #         if row1[j]
                
            
        #     return(arrS)
        
        # # 1 
        # arrSorted = 
## The Zen of Python, by Tim Peters
import this 
# -> str -> bool
# -> float
# -> None
def isEven(value: int) -> int:
    """Return True if and only if the value is divisible by 2

    >>> isEven(4)
    True
    >>> isEven(17)
    False
    """
    return value%2 == 0

isEven(4)
isEven(17)

# find all methods
dir(list)

help(list.append)
help(list.extend)

lst1 = [1, 2, 3]
id(lst1)
lst2 = lst1
id(lst2)
lst1.count(1)
lst1.append(4)
id(lst1)
id(lst2)

