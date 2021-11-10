# Practical Programming

## General Programming Knowledge

### Tips

- Parentheses (); Brackets []; Braces {}. 
- Line split. In order to split up a statement into more than one 
  line, you need to do one of two things:
  1. Make sure your line break occurs inside parentheses.
  2. Use the line-continuation character, which is a backslash \\.

### Making Code Readable

In particular, we always put a space before and after every binary 
operator. Using names like `celsius`, `average`, and `final_result`
for variables. The style guide for Python from http://www.python.org/dev/peps/pep-0008/.



## General Python

### Python Memory Model

#### Arithmetic

- Integer Division: //.
- Modulo/Remainder: %, such as 17 % -10 = -3.  
- Exponentiation: **. 

#### Data

All data in a Python program is stored in **objects** that have 
three components: **id, type and value**. 

The **id** of an **object** is a unique identifier, meaning that 
no other object has the same identifier. Often Python uses the 
memory address of the object as its id, but it does not have to. 
Calling the `id` function to check the id.

The **type** of an object can be checked by calling `type` function.

Finally, evaluating the **value** is straight forward by typing an 
object into the Python terminal. 

#### Variables

 In Python, a **variable** is not an object, and so does not actually 
 store data; it stores/contains an **id** that refers to an object 
 that stores 
 data. The variable only refers to the object. Reassigning a 
 variable will change the **id**, referring to a new value.

#### Executing an assignment statement

This is what Python does when an assignment statement is executed:

1. Evaluate the expression on the right-hand side, yielding the id 
of an object.
2. If the variable on the left-hand-side does not already exist, 
   create it, otherwise, just reuse the existing variable.
3. Store the id from the expression on the right-hand-side in the 
   variable on the left-hand side.

#### Augmented Assignment

An augmented assignment combines an assignment statement with an operator
to make the statement more concise, such as `*=`, `+=` and `-=`.

#### Errors

Two kinds of errors in Python: **syntax errors**, which happen when 
you type something that isn’t valid Python code, and **semantic 
errors**, which happen when you tell Python to do something that 
it just can’t do, like divide a number by zero or try to use a 
variable that does not exist.

#### Execution of a function call

Here are the rules to executing a function call:
1. Evaluate each argument one at a time, working from left to right.
2. Create a namespace to hold the function call’s local variables, including
the parameters.
3. Pass the resulting values into the function by assigning them 
   to the parameters. 
4. Execute the function. When the function call finishes, it 
   produces a value. The value of the expression in the return 
   statement is used as the value of the function call. 

#### Cache, mutability and aliasing

A cache is a collection of data. Because small integers—up to about 250 or so,
depending on the version of Python you’re using—are so common, Python creates
those objects as it starts up and reuses the same objects whenever it can.

> i = 3  
j = 3  
k = 4 - 1  
id(i)    
4296861792  
id(j)  
4296861792  
id(k)  
4296861792

What that means is that variables i, j, and k refer to the exact same object. This is
called **aliasing**.

#### Function

The **function header** (that’s the first line of the function 
definition) starts with `def`, followed by the name of the 
function, then a comma-separated list of parameters within 
parentheses, and then a colon. A parameter is a variable. Below 
the function header is the indented block of statements called the 
**function body**, which must contain at least one statement. 

Variables created within a function are called **local variables**. 
Local variables get created each time that function is called, and
they are erased when the function returns. A function’s parameters 
are also local variables. The area of a program that a variable 
can be used in is called the variable’s **scope**. The scope of a 
local variable is from the line in which it is defined up
until the end of the function.

#### Function Designing: A Recipe

Every time you write a function, you need to figure out the answers to the fol-
lowing questions:
- What do you name the function?
- What are the parameters, and what types of information do they 
  refer to?
- What calculations are you doing with that information?
- What information does the function return?
- Does it work like you expect?

  
Outcome:

- A function
- The documentation of this function

Example:
> def days_difference(day1: int, day2: int) -> int:  
 """Return the number of days between day1 and day2, which are  
 both in the range 1-365 (thus indicating the day of the year).  
> \>>> days_difference(200, 224)  
 24  
> \>>> days_difference(50, 50)  
 0  
> \>>> days_difference(100, 99)  
 -1  
 """  
 return day2 - day1

There are five steps to the function design recipe.
1. Examples: function name and outcome.
2. Header. The second step is to decide on the parameter names, 
   parameter types, and return type and write the function header. 
   
3. Description. Write a short paragraph describing your function: 
   this is what other programmers will read
4. Function body.
5. Test. Run the examples to make sure your function body is 
      correct.