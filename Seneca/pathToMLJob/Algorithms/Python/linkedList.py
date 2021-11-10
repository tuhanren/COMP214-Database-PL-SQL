# define a node class, node in linked list
class Node(object): # the object is the identifier, base object in python to inherit

    def __init__(self, val):
        self.val = val
        # single linked node
        self.next = None

    # getter and setter methods
    def get_data(self):
        return self.val
    
    def set_data(self, val):
        self.val = val
    
    def get_next(self):
        return self.next
    
    def set_next(self, next):
        self.next = next

# the linked list class
class LinkedList(object):
    
    def __init__(self, head = None):
        self.head = head
        self.count = 0

    def get_count(self):
        return self.count

    # From now on, methods are more important. 
    def insertAtHead(self, data):
        new_node = Node(data)
        new_node.set_next(self.head)
        self.head = new_node
        self.count += 1
    
    def find(self, val):
        # find from the beginning 
        item = self.head
        while (item != None):
            if item.get_data() == val:
                return item
            else:
                item = item.get_next()
        return None
        # return print(f"The linked list does not contain the value: {val}.")

    def findAt(self, idx):
        # start from the begining 
        item = self.head
        # TODO: diff idx ranges,  
        if (idx < 0) or (idx > self.count - 1):
            return 
        elif idx == 0:
            return item
        else:
            i = 0
            # my wife Wen code 
            while i < idx:
                item = item.get_next()
                i += 1
            # my wife Wen code 
            return item
    # TODO: use findAt()
    # def deleteAt(self, idx):
    #     # if idx > self.count - 1:
    #     #     # the same as return None
    #     #     # return None and return
    #     #     return
    #     # else:
    #     # TODO: We build this upon findAt
    #     if idx == 0:
    #         self.head = self.head.get_next()
    #     else:
    #         item = self.findAt(idx - 1)
    #         # itemAfter = self.findAt(idx - 1)
    #         # item.set_next(itemAfter)
    #         # TODO: remember the trick
    #         item.set_next(item.get_next().get_next())
    #         self.count -= 1

    def deleteAt(self, idx):
        if idx > self.count - 1:
            return
        elif idx == 0:
            self.head = self.head.set_next()
        else:
            tmpIdx = 0
            item = self.head
            while tmpIdx < idx - 1:
                item = item.get_next()
                tmpIdx += 1
            item.set_next(item.get_next().get_next())

            self.count -= 1

    # utility function, print the content of the list
    def dump_list(self):
        tmpNode =self.head
        while (tmpNode != None):
            print("Node: ", tmpNode.get_data())
            tmpNode = tmpNode.get_next()

########### TODO: test the class #############
# create a linkedlist 
itemlist = LinkedList()
itemlist.dump_list()
itemlist.insertAtHead(38)
itemlist.dump_list()

itemlist.insertAtHead(49)
itemlist.insertAtHead(13)
itemlist.insertAtHead(15)
itemlist.dump_list()


print("Item count: ", itemlist.get_count())
print("Finding item: ", itemlist.find(13).get_data())
print("Finding item: ", itemlist.find(78))

# first we have find by index 
print(itemlist.findAt(2).get_data())
# out of range 
print(itemlist.findAt(4))
print(itemlist.findAt(-1))

# then we have delete by index 
itemlist.deleteAt(2)
# this use the method
print("Count: ", itemlist.get_count())
print("Value: ", itemlist.find(49))
print("Value: ", itemlist.findAt(2).get_data())
print(itemlist.dump_list())

# continue deleting
itemlist.deleteAt(2)
print(itemlist.dump_list())
# TODO: compare methods and attributes
# this use the attribute
# print(itemlist.count)


    

