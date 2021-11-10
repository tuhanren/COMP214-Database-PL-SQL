# import test
# test.multiply(10,34)

# try string
first_name = 'malala'
print(first_name.capitalize())

print(first_name.find('la'))
print(first_name.index('la'))
note = 'award: nobel peace price'
award = note[7:]
print(award)

# regular expression

# use raw string when doing regular expression
# the first is \ and n, the 2nd is the character of new line
r"\n" == "\n"
# "\\" is \
print('\\')

import re
five_digit_zip = '98101'
nine_digit_zip = '98101-0003'
phone_number ='234-567-8901'

print(re.search( r"\d{3}" , phone_number))
print(re.search( r"\d{5}" , five_digit_zip))
print(re.search( r"\d{5}" , phone_number))

# input and output .txt files
# "r" means open and read, "t" means text mode
valuefile = open("values.txt", "rt")
# "w" means open and write, can rewrite
outfile = open("values-totaled.txt", "wt")
print('Processing Input')
sum = 0
for line in valuefile:
    sum += float(line)
    # .rstrip to remove the trailing the \n
    print(line.rstrip(), file = outfile)
print("\nTotal: " + str(sum), file = outfile)
outfile.close()
print("Output Complete")

# 
i = 10
while i > 0:
    i -= 1
    print(i)

# check linting
for value in range(10):
    print(value) 
    # print(val) # the tilde show under val is the linting process
print("All Done!")

# Attendee class
class Attendee:
    """
    Simple test class have attendee name and ticket quantity
    """
    def __init__(self, name, ticket):
        self.name = name
        self.ticket = ticket
    
    def displayAttendee(self):
        print(f"Attendee: {self.name}. Ticket Quantity: {self.ticket}. ")
    
    def addTicket(self):
        self.ticket += 1
        print(f"Now you have {self.ticket} tickets.")

Attendee1 = Attendee("Qiwen", 1)
Attendee2 = Attendee("Gavin", 2)
Attendee1.addTicket()
Attendee1.addTicket()
Attendee2.displayAttendee()
Attendee1.displayAttendee()
