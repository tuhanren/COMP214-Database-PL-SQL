// test array
var perStuPetCount = [0, 1, 3, 1]
var numOfStu = perStuPetCount.count 

print(perStuPetCount[0])
print(numOfStu)

// total pet
var sum = 0
for i in perStuPetCount{
    sum = sum + i
}

print(sum)

var averPet = sum/numOfStu

print(averPet)

// TODO: Stack
class Stack {
    // use a resizable array
    var stackArray = [String]()
    // push
    func push(item:String){
        self.stackArray.append(item)
    }

    // pop
    // ? optional type
    func pop()->String?{
        if self.stackArray.last != nil {
            let lastString = self.stackArray.last
            self.stackArray.removeLast()
            // ! wrap the optional output, there exist or do not exist output
            return lastString!
        } else {
            return nil
        }
    }
}

// instance
var deck:Stack = Stack()


// TODO: queue
class Queue {
    // use a resizable array
    var stackArray = [String]()
    // push
    func push(item:String){
        self.stackArray.append(item)
    }

    // pop
    // ? optional type
    func pop()->String?{
        if self.stackArray.last != nil {
            let lastString = self.stackArray.last
            self.stackArray.removeLast()
            // ! wrap the optional output, there exist or do not exist output
            return lastString!
        } else {
            return nil
        }
    }
}

// instance
var deck:Stack = Stack()