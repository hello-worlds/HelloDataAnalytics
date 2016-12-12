#!/usr/local/bin/python3.5
#!/usr/local/bin/python3
#!/usr/bin/python2.6
#!/usr/bin/python2.7
# First comment
# code above is interpreter definition for bash execution



'''
Created on Sep 7, 2016

@author: richasdy
'''

_identifier="private identifier"
__identifier="strongly private identifier"
__identifier__="a language-defined special names"

print(__identifier__)
print("Hello, Python!")
print(4*4)

if True:
    print ("Answer")
    print(True)
else:
    print ("Answer")
print(False)

item_one=1
item_two=2
item_three=3
total = item_one + \
        item_two + \
        item_three
print(total)

days = ['Monday', 'Tuesday', 'Wednesday',
        'Thursday', 'Friday']
print(days)
print(days[2])

# input("\n\nPress the enter key to exit.")

import sys; x = 'foo'; sys.stdout.write(x + '\n')

word = 'word'
sentence = "This is a sentence."
paragraph = """This is a paragraph. It is
made up of multiple lines and sentences."""
print(word)
print(sentence)
print(paragraph)
print word

# raw_input("\n\nPress the enter key to exit.")

counter = 100          # An integer assignment
miles   = 1000.0       # A floating point
name    = "John"       # A string

print counter
print miles
print name

a = b = c = 1
a, b, c = 1, 2, "john"

var1 = 1
var2 = 10

print var1
del var1
# print var1 # error

str = 'Hello World!'

print str          # Prints complete string
print str[0]       # Prints first character of the string
print str[2:5]     # Prints characters starting from 3rd to 5th
print str[2:]      # Prints string starting from 3rd character
print str * 2      # Prints string two times
print str + "TEST" # Prints concatenated string

list = [ 'abcd', 786 , 2.23, 'john', 70.2 ]
tinylist = [123, 'john']

print list          # Prints complete list
print list[0]       # Prints first element of the list
print list[1:3]     # Prints elements starting from 2nd till 3rd 
print list[2:]      # Prints elements starting from 3rd element
print tinylist * 2  # Prints list two times
print list + tinylist # Prints concatenated lists

tuple = ( 'abcd', 786 , 2.23, 'john', 70.2  )
tinytuple = (123, 'john')

print tuple           # Prints complete list
print tuple[0]        # Prints first element of the list
print tuple[1:3]      # Prints elements starting from 2nd till 3rd 
print tuple[2:]       # Prints elements starting from 3rd element
print tinytuple * 2   # Prints list two times
print tuple + tinytuple # Prints concatenated lists

tuple = ( 'abcd', 786 , 2.23, 'john', 70.2  )
list = [ 'abcd', 786 , 2.23, 'john', 70.2  ]
# tuple[2] = 1000    # Invalid syntax with tuple
list[2] = 1000     # Valid syntax with list

dict = {}
dict['one'] = "This is one"
dict[2]     = "This is two"

tinydict = {'name': 'john','code':6734, 'dept': 'sales'}

print dict['one']       # Prints value for 'one' key
print dict[2]           # Prints value for 2 key
print tinydict          # Prints complete dictionary
print tinydict.keys()   # Prints all the keys
print tinydict.values() # Prints all the values

var = 100
if ( var  == 100 ) : print "Value of expression is 100"
print "Good bye!"

for letter in 'Python':     # First Example
   if letter == 'h':
      break
   print 'Current Letter :', letter
  
var = 10                    # Second Example
while var > 0:              
   print 'Current variable value :', var
   var = var -1
   if var == 5:
      break

print "Good bye!"


for letter in 'Python':     # First Example
   if letter == 'h':
      continue
   print 'Current Letter :', letter

var = 10                    # Second Example
while var > 0:              
   var = var -1
   if var == 5:
      continue
   print 'Current variable value :', var
print "Good bye!"

for letter in 'Python': 
   if letter == 'h':
      pass
      print 'This is pass block'
   print 'Current Letter :', letter

print "Good bye!"   

print "abs(-45) : ", abs(-45)
print "abs(100.12) : ", abs(100.12)
print "abs(119L) : ", abs(119L)

# update String
var1 = 'Hello World!'
print "Updated String :- ", var1[:6] + 'Python'

#string formating operator
print "My name is %s and weight is %d kg!" % ('Zara', 21) 

para_str = """this is a long string that is made up of
several lines and non-printable characters such as
TAB ( \t ) and they will show up that way when displayed.
NEWLINEs within the string, whether explicitly given like
this within the brackets [ \n ], or just a NEWLINE within
the variable assignment will also show up.
"""
print para_str

print 'C:\\nowhere'
print r'C:\\nowhere'
print u'Hello, world!'


Str = "this is string example....wow!!!";
Str = Str.encode('base64','strict');

print "Encoded String: " + Str
print "Decoded String: " + Str.decode('base64','strict')

str = "this is string example....wow!!!";

sub = "i";
print "str.count(sub, 4, 40) : ", str.count(sub, 4, 40)
sub = "wow";
print "str.count(sub) : ", str.count(sub)

str1 = "this is string example....wow!!!";
str2 = "exam";

print str1.find(str2)
print str1.find(str2, 10)
print str1.find(str2, 40)

s = "-";
seq = ("a", "b", "c"); # This is sequence of strings.
print s.join( seq )

# from string import maketrans   # Required to call maketrans function.
# intab = "aeiou"
# outtab = "12345"
# trantab = maketrans(intab, outtab)
# str = "this is string example....wow!!!"
# print str.translate(trantab)


list = ['physics', 'chemistry', 1997, 2000];

print "Value available at index 2 : "
print list[2]
list[2] = 2001;
print "New value available at index 2 : "
print list[2]

list1 = ['physics', 'chemistry', 1997, 2000];

print list1
del list1[2];
print "After deleting value at index 2 : "
print list1

print len([1, 2, 3])
print [1, 2, 3] + [4, 5, 6]
print ['Hi!'] * 4
print 3 in [1, 2, 3]
for x in [1, 2, 3]: print x

tup1 = ('physics', 'chemistry', 1997, 2000);
tup2 = (1, 2, 3, 4, 5, 6, 7 );

print "tup1[0]: ", tup1[0]
print "tup2[1:5]: ", tup2[1:5]

tup1 = (12, 34.56);
tup2 = ('abc', 'xyz');

# Following action is not valid for tuples
# tup1[0] = 100;

# So let's create a new tuple as follows
tup3 = tup1 + tup2;
print tup3

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'}

print "dict['Name']: ", dict['Name']
print "dict['Age']: ", dict['Age']

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'}

dict['Age'] = 8; # update existing entry
dict['School'] = "DPS School"; # Add new entry


print "dict['Age']: ", dict['Age']
print "dict['School']: ", dict['School']

dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'}

del dict['Name']; # remove entry with key 'Name'
dict.clear();     # remove all entries in dict
del dict ;        # delete entire dictionary

# print "dict['Age']: ", dict['Age']
# print "dict['School']: ", dict['School']

dict = {'Name': 'Zara', 'Age': 7, 'Name': 'Manni'}

print "dict['Name']: ", dict['Name']

import time;  # This is required to include time module.
ticks = time.time()
print "Number of ticks since 12:00am, January 1, 1970:", ticks

import time;
localtime = time.localtime(time.time())
print "Local current time :", localtime

import calendar

cal = calendar.month(2008, 1)
print "Here is the calendar:"
print cal


# Function definition is here
def printme( str ):
   "This prints a passed string into this function"
   print str
   return;

# Now you can call printme function
printme("I'm first call to user defined function!")
printme("Again second call to the same function")

# Function definition is here
def changeme( mylist ):
   "This changes a passed list into this function"
   mylist.append([1,2,3,4]);
   print "Values inside the function: ", mylist
   return

# Now you can call changeme function
mylist = [10,20,30];
changeme( mylist );
print "Values outside the function: ", mylist

# Function definition is here
def changemen( mylist ):
   "This changes a passed list into this function"
   mylist = [1,2,3,4]; # This would assig new reference in mylist
   print "Values inside the function: ", mylist
   return

# Now you can call changeme function
mylist = [10,20,30];
changemen( mylist );
print "Values outside the function: ", mylist

# Function definition is here
def printinfon( name, age ):
   "This prints a passed info into this function"
   print "Name: ", name
   print "Age ", age
   return;

# Now you can call printinfo function
printinfon( age=50, name="miki" )

# Function definition is here
def printinfos( name, age = 35 ):
   "This prints a passed info into this function"
   print "Name: ", name
   print "Age ", age
   return;

# Now you can call printinfo function
printinfos( age=50, name="miki" )
printinfos( name="miki" )

# Function definition is here
def printinfo( arg1, *vartuple ):
   "This prints a variable passed arguments"
   print "Output is: "
   print arg1
   for var in vartuple:
      print var
   return;

# Now you can call printinfo function
printinfo( 10 )
printinfo( 70, 60, 50 )


# Function definition is here
sum = lambda arg1, arg2: arg1 + arg2;

# Now you can call sum as a function
print "Value of total : ", sum( 10, 20 )
print "Value of total : ", sum( 20, 20 )

# Function definition is here
def sumy( arg1, arg2 ):
   # Add both the parameters and return them."
   total = arg1 + arg2
   print "Inside the function : ", total
   return total;

# Now you can call sum function
total = sumy( 10, 20 );
print "Outside the function : ", total 


# Import module support
import support

# Now you can call defined function that module as follows
support.print_func("Zara")

Money = 2000
def AddMoney():
   # Uncomment the following line to fix the code:
   global Money
   Money = Money + 1

print Money
AddMoney()
print Money


# Import built-in module math
import math
content = dir(math)
print content


# Now import your Phone Package.
import pyPackage

pyPackage.Pots()
pyPackage.Isdn()
pyPackage.G3()

print "Python is really a great language,", "isn't it?"


# str = raw_input("Enter your input: ");
# print "Received input is : ", str
# 
# 
# str = input("Enter your input: ");
# print "Received input is : ", str

# Open a file
fo = open("foo.txt", "wb")
print "Name of the file: ", fo.name
print "Closed or not : ", fo.closed
print "Opening mode : ", fo.mode
print "Softspace flag : ", fo.softspace


# Open a file
fo = open("foo.txt", "wb")
print "Name of the file: ", fo.name

# Close opend file
fo.close()


# Open a file
fo = open("foo.txt", "wb")
fo.write( "Python is a great language.\nYeah its great!!\n");

# Close opend file
fo.close()


# Open a file
fo = open("foo.txt", "r+")
str = fo.read(10);
print "Read String is : ", str
# Close opend file
fo.close()


# Open a file
fo = open("foo.txt", "r+")
str = fo.read(10);
print "Read String is : ", str

# Check current position
position = fo.tell();
print "Current file position : ", position

# Reposition pointer at the beginning once again
position = fo.seek(0, 0);
str = fo.read(10);
print "Again read String is : ", str
# Close opend file
fo.close()



#!/usr/bin/python
def KelvinToFahrenheit(Temperature):
   assert (Temperature >= 0),"Colder than absolute zero!"
   return ((Temperature-273)*1.8)+32
print KelvinToFahrenheit(273)
print int(KelvinToFahrenheit(505.78))
# print KelvinToFahrenheit(-5)


try:
   fh = open("testfile", "w")
   fh.write("This is my test file for exception handling!!")
except IOError:
   print "Error: can\'t find file or read data"
else:
   print "Written content in the file successfully"
   fh.close()
   
   
try:
   fh = open("testfile", "r")
   fh.write("This is my test file for exception handling!!")
except IOError:
   print "Error: can\'t find file or read data"
else:
   print "Written content in the file successfully"
   
print 4*4


# Define a function here.
def temp_convert(var):
   try:
      return int(var)
   except ValueError, Argument:
      print "The argument does not contain numbers\n", Argument

# Call above function here.
temp_convert("xyz");