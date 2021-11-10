# TODO: Bubble Sort, the largest number bubble to the right
def bubbleSort(numList):
    # for each round of outter loop, the largest value bubble to the right
    # TODO: define the range of index
    # range(5, 0, -1): 5, 4, 3, 2, 1
    for i in range(len(numList) - 1, 0, -1):
        for j in range(i):
            if numList[j] >= numList[j + 1]:
                numList[j], numList[j + 1] = numList[j + 1], numList[j]
        #print intermediate steps
        print("Real Time: ", numList)

# def bubbleSort(numList):
#     for n in range(len(numList)):
#         for m in range(n + 1, len(numList)):
#             # compared with (numList[n] > numList[n + 1])
#             # the true bubble sort, compare between array[n] and array[n + 1]
#             if numList[n] > numList[m]:
#                 numList[n], numList[m] = numList[m], numList[n]
#         # print intermediate steps
#         print("Real Time: ", numList)

#     return numList

# TODO: the merge sort
# the divide-and-conquer algorithm
def mergeSort(numList):
    if len(numList) == 1:
        return numList
    else: 
        # TODO: Do the divide, sort and merge part 
        return 

# TODO: function to merge two sorted list 
def mergeSorted(sorted1, sorted2):
    tmpList = []
    i, j = 0, 0
    while (i < len(sorted1)) and (j < len(sorted2) ):
        if sorted1[i] <= sorted2[j]:
            tmpList.append(sorted1[i])
            i += 1
        else: 
            tmpList.append(sorted2[j])
            j += 1
        
    if i == len(sorted1):
        tmpList.append(sorted2[j:])
    else:
        tmpList.append(sorted1[i:])
    return tmpList  

print(mergeSorted([12, 19 ,31, 45], [4, 23] ))

# TODO: the insertion sort 
def insertionSort(numList):
    # numList[j] is the key, the card to be sorted
    for j in range(1, len(numList)):
        key = numList[j]
        #TODO: for i = 0 to i = j - 1, the cards were sorted
        i = j - 1
        while i >= 0 and numList[i] > key:
            # TODO: compare one by one, but these were already sorted
            # move to right by one index
            numList[i + 1] = numList[i]
            i -= 1
        # use the property at the end of loop, i is value of the point exit - 1
        numList[i + 1] = key
        print(f"Current state of the array: {numList}")
    
    return numList

# TODO: the quick sort

# TODO: use main in Python

def main():
    aTest = list([6,8,1,2,3,4,4])
    print(bubbleSort(aTest))
    aTest = list([6,8,1,2,3,4,4])
    print(insertionSort(aTest))

if __name__ == "__main__":
    main()

print(5//2)

def quickSort(numList):
    i = 0
    j = 0
    while i < j:
        if numList[i] > numList[0]:
            tmpI = numList[i]
        if numList[j] < numList[0]:
            i += 1
            j -= 1



class Test(object):
    pass