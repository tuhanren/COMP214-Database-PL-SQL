// multi-dimensional arrays
// string must double quotation
var dinnerChoices = [["Salad", "Mussels"], ["Lasagna", "Salmon", "Tuna"], ["Brownie", "Pudding"]]

let firstApp = dinnerChoices[0][0]
let thirdMain = dinnerChoices[1][2]

// show
console.log(firstApp)
console.log(thirdMain)

// change
dinnerChoices[1][1] = "steak"
console.log(dinnerChoices)