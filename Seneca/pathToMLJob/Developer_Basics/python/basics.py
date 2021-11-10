# TODO: define main
def mainPrint():
    print("Hello World!")
    # TODO: define the global variable 
    global f 
    f = "global variable"
    print(f)

# # TODO: call main function
# if __name__ == "__main__":
#     main()
# make global variable f
mainPrint()
# TODO: delete defined variable 
del f

# TODO: use * argument to pass a variable number of multiple arguments 
# TODO: this must the last parameter
def testFun(*num):
    print(sum(num))

testFun(1,2,3,4,5)

# testList = [1,2,3,4,4]
# testFun(testList)
# These do not work 

def mainIf():
    x, y = 10, 100
    if (x < y):
        state = f"{x} is less than {y}"
    else:
        state = f"{x} is greater than or equal to {y}"
    print(state)

mainIf()


# TODO: understand the if __name__ == "__main__"
# # if this file is imported, then __name__ == "basics"
# # if this file is ran by python basics.py, then __name__ = "__main__"
# if __name__ == "__main__":
#     mainIf()

# one line code of if else 
x, y = 100, 10
print(f"{x} is greater than {y}") if (x > y) else print(f"{x} is less than {y}") 

# TODO: the continue and break in loop
print("Break:")
for x in range(4, 10):
    if x == 7: break
    print(x)

print("Continue:")
for x in range(4, 10):
    if (x % 2) == 0: 
        continue
    print(x)

# TODO: using enumerate to get the index
days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
for i, d in enumerate(days):
    print(i, d)

# TODO: practice class 
# TODO: self is like this keword in Javascript
class myClass():
    def __init__(self):
        self.name = "Stock"
        self.type = "Bull"
    
    def method1(self):
        print(f"{self.name} will always be {self.type}")

    def method2(self, someTimeString):
        print(f"{self.type} will be {someTimeString} long!")

# instantiate 
testClass = myClass()
testClass.method1()
testClass.method2("10 years")

class anotherClass(myClass):
    def method1(self):
        # TODO: inherited methods and overriding
        myClass.method1(self)
        print("The first inherited class.")

    def method3(self):
        print("The first method in anotherClass.")

# instantiate 
testClass1 = anotherClass()
testClass1.method1()
testClass1.method2("Life")
testClass1.method3()