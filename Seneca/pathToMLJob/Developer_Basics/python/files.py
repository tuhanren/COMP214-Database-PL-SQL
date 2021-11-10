def mainFileCreate():
    # Open a file for writing, if not exist then create it
    f = open("textTest.txt", "w+")
    # write some text
    for i in range(10):
        f.write(f"This is line: {i}. \r\n")
    
    # close file
    f.close()

def mainFileAppend():
    # a is append
    f = open("textTest.txt", "a")
    for i in range(11, 20):
        f.write(f"This is line: {i}. \r\n")
    
    # close file
    f.close()

def mainFileRead():
    # read txt file
    f = open("textTest.txt", "r")
    # make sure the file is successfully opened
    if f.mode == "r":
        contents = f.read()
        print(contents)
        # print(f.read())

def readLine():
    f = open("textTest.txt", "r") 
    if f.mode == "r":      
        fl = f.readlines()
        for x in fl:
            print(x)

# TODO: operating system 
import os
from os import path
import datetime
import time
# TODO: use shell utility 
import shutil 
from zipfile import ZipFile

print(os.name)
# check if exists
print( "Exist: "+ str(path.exists("textTest.txt")) )
path.exists("textTest.txt")

# check if file or folder
print("A file: "+ str(path.isfile("textTest.txt")))
print("A Directory: "+ str(path.isdir("textTest.txt")))
print("A Link: "+ str(path.islink("textTest.txt")))
# get real path 
print("Full path: "+ str(path.realpath("textTest.txt")))
print("Full path and Name: "+ str(path.split(path.realpath("textTest.txt"))))


# convert time, or get the current time
import time
print(f"Current time: {time.ctime()}")
print("Modification time: " + str(time.ctime(path.getmtime("textTest.txt"))))
# using getmtime function to get a datetime object 
import datetime
print(datetime.datetime.fromtimestamp(path.getmtime("textTest.txt")))
# seconds since Epoch
print(path.getmtime("textTest.txt"))

# get timedelta
print("Total seconds: "+ str( (datetime.datetime.now() - datetime.datetime.fromtimestamp(path.getmtime("textTest.txt"))).total_seconds() ) )


def mainShellFile(filename = "textTest.txt"):
    if path.exists(filename):
        # TODO: .bak the backup file 
        # source file
        src = str(path.realpath(filename))
        # destination file
        dst = src + ".bak"
        # THE shell command like copy 
        # the copy only copy the content
        shutil.copy(src, dst)
        # TODO: copy meta data together with the file 
        # shutil.copystat(src, dst)
        os.rename(filename, "textTest2.txt")

src = str(path.realpath("textTest.txt"))
root_dir, tail = path.split(src)
# make archive of the entire folder 
shutil.make_archive("testArchive", "zip", root_dir)

# object constructor
# w write access
# with to create a local scope, to create a new object testzip
# this object temporarily named as newzip
with ZipFile("testzip.zip", "w") as newzip:
    newzip.write("textTest.txt")
    newzip.write("textTest.txt.bak")


if __name__ == "__main__":
    # mainFileCreate()
    # mainFileAppend()
    mainFileRead()