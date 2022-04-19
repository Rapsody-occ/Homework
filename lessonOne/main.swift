//
//  main.swift
//  lessonOne
//
//  Created by user on 4/12/22.
//

import Foundation
//
//        2ND HOMEWORK
//
// 1st exercise "Write a function that determines if a number is even or not."
// was created function which don't return something, because in this exercise we can use such function
print("▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Write a function that determines if a number is even or not. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
func evenOrOdd(number: Int) {
    if number % 2 == 0 {
        print("The number \(number) is even.")
    } else {
        print("The number \(number) is odd.")
    }
}
// demonstrating the result of a function call (using a "For-In Loop")
// number of iterations "For-In Loop" can be set via variables
let initialNumber = 0
let lastNumber = 10
print("Numbers from \(initialNumber) to \(lastNumber) will be checked for evenness:")
for i in initialNumber...lastNumber {
    evenOrOdd(number: i)
}


// 2nd exercise "Write a function that determines if a number is evenly divisible by 3."
// using "Switch", for diversity, since I did the 1st exercise through "If"
print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Write a function that determines if a number is evenly divisible by 3. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
func checkDivisionBy3(number: Int) {
    switch number {
    case _ where number == 0:
        print("Dividing zero by any number gives a remainder of 0.")
    case _ where number % 3 == 0:
        print("The number \(number) can be divisible by 3 without a remainder")
    case _ where number % 3 != 0:
        print("The number \(number) cannot be divisible by 3 without a remainder.")
    default:
        print("An error has occurred.")
    }
    }
// demonstrating the result of a function call (using a "For-In Loop")
// number of iterations "For-In Loop" can be set via variables
let primaryNumber = 0
let finalNumber = 10
print("For numbers from \(primaryNumber) to \(lastNumber), will be checked for the possibility of dividing without a remainder by 3 will be checked:")
for i in primaryNumber...lastNumber {
    checkDivisionBy3(number: i)
}


// 3rd exercise "Create an increasing array of 100 numbers."
print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Create an increasing array of 100 numbers. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
var increasingArray = [Int]()
for i in 0...99 {
    increasingArray.append(i)
}
// printed the created array on the screen
print(increasingArray)


// 4th exercise "Remove from this array (array from 3rd exercise) all even numbers and all numbers that are not divisible by 3."
print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Remove from this array (array from 3rd exercise) all even numbers and all numbers that are not divisible by 3. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
// using functional filtering (use 2 functions instead of 1 to make the code more universal
func arrayElementParityCheck(arrayElement: Int) -> Bool {
    return arrayElement % 2 == 0
}
func arrayElementDivisionBy3(arrayElement: Int) -> Bool {
    return arrayElement % 3 == 0
}
increasingArray = increasingArray.filter(arrayElementParityCheck)
print("An array from 0 to 99, with only even numbers:\n",increasingArray)
increasingArray = increasingArray.filter(arrayElementDivisionBy3)
print("\nAn array from 0 to 99, with only even numbers that can be divisible by 3 without a remainder:\n",increasingArray)


// 5th exercise "Remove from this array (array from 3rd exercise) all even numbers and all numbers that are not divisible by 3."
print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Write a function that adds a new Fibonacci number to an array and add 50 elements with it. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
func arrayFibonacci(array: inout Array<Int>) -> Array<Int> {
    var previousNumberMinusOne = 0
    var previousNumber = 1
    // manually add the element "1" to the array, because according to the sequence of Fibonacci numbers, the new value is equal to the sum of the two previous values ​​(if you do not add "1" it will always be 0 + 0, therefore it will not work to create a sequence of Fibonacci numbers)
    array.append(1)
    for _ in 0...49 {
        let newNumber = previousNumberMinusOne + previousNumber
        array.append(newNumber)
        previousNumberMinusOne = previousNumber
        previousNumber = newNumber
    }
return array
}
var arrayFibonacci = [Int]()
print(arrayFibonacci(array: &arrayFibonacci))


// 6th exercise "Fill an array of 100 elements with various prime numbers."
print("\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Fill an array of 100 elements with various prime numbers. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
// create of function that checks if a number is prime
func primeNumberCheck (number: Int) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }

    return true
}
// create of an empty array that will be filled with simple values
var arrayWithPrimeNumbers = [Int]()
// create of a function that will fill the array with prime numbers using the "primeNumberCheck" function for checking
func oneHundredPrimeNumbers (array: inout Array<Int>) -> Array<Int> {
    var i = 2
    while array.count < 100 {
        if primeNumberCheck(number: i) {
            array.append(i)
        }
        i += 1
    }
    return array
}
print("Array with 100 prime numbers:\n",oneHundredPrimeNumbers(array: &arrayWithPrimeNumbers),"\n")
//
//        1ST HOMEWORK
//
//// 1st exercise "Solution of a quadratic equation."
//// using Optional<Double> type to check to be able to check that all constants have values
//print("▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Solution of a quadratic equation. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//let aCoefficient: Double? = 1
//let bCoefficient: Double? = 5
//let cCoefficient: Double? = 3
//// using "if" to check that all constants have values
//if (aCoefficient != nil) && (bCoefficient != nil) && (cCoefficient != nil) {
//    let discriminant = pow(bCoefficient!, 2) - 4 * (aCoefficient!) * (cCoefficient!)
//    // use "switch" to calculate the root, depending on the data, if there is a root. (I used "switch" because it requires less resources than "if". LET ME KNOW IF I AM WRONG!)
//    switch discriminant {
//    case _ where discriminant == 0:
//        let x = (-bCoefficient!) / (2 * aCoefficient!)
//        print("In the quadratic equation where:" +
//              "\ncoefficient a = \(aCoefficient!)," +
//              "\ncoefficient b = \(bCoefficient!)," +
//              "\ncoefficient c = \(cCoefficient!)," +
//              "\nthe discriminant = 0, the only one root = \(x).\n")
//    case _ where discriminant > 1:
//        let x1 = ((-bCoefficient! + sqrt(discriminant)) / (2 * aCoefficient!))
//        let x2 = ((-bCoefficient! - sqrt(discriminant)) / (2 * aCoefficient!))
//        print("In the quadratic equation where:" +
//              "\ncoefficient a = \(aCoefficient!)," +
//              "\ncoefficient b = \(bCoefficient!)," +
//              "\ncoefficient c = \(cCoefficient!)," +
//              "\nthe discriminant > 0, there are two roots.\nFirst root = \(x1), second root = \(x2).\n")
//    case _ where discriminant < -1:
//        print("In the quadratic equation where:" +
//              "\ncoefficient a = \(aCoefficient!)," +
//              "\ncoefficient b = \(bCoefficient!)," +
//              "\ncoefficient c = \(cCoefficient!)," +
//              "\nthe discriminant is negative, therefore there are no real roots.\n")
//    default: print("There is some error in switch with discriminant")
//    }
//// if one coefficient is equal to "nil", then the program will say about it and indicate in which specific constant with the coefficient it is necessary to write the data
//} else if aCoefficient == nil {
//    print("Coefficient a = nil, please enter a value for coefficient a.\n")
//    }
//    if bCoefficient == nil {
//        print("Coefficient b = nil, please enter a value for coefficient b.\n")
//        }
//    if cCoefficient == nil {
//        print("Coefficient c = nil, please enter a value for coefficient c.\n")
//        }
//
//// 2nd exercise "Given the legs of a right triangle. Find the area, perimeter and hypotenuse of a triangle."
//print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Given the legs of a right triangle. Find the area, perimeter and hypotenuse of a triangle. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//// using Optional<Double> type to check to be able to check that all constants have values
//let aLeg: Double? = 15
//let bLeg: Double? = 20
//// using "if" to check that all constants have values and that they are not equal to 0
//if aLeg != nil && bLeg != nil && aLeg != 0 && bLeg != 0 {
//    let hypotenuse = (pow (aLeg!, 2) + pow (bLeg!, 2)).squareRoot()
//    let rectanglePerimeter = aLeg! + bLeg! + hypotenuse
//    var rectangleArea = (aLeg! + bLeg! + hypotenuse) / 2
//    rectangleArea = (rectangleArea * (rectangleArea - aLeg!) * (rectangleArea - bLeg!) * (rectangleArea - hypotenuse)).squareRoot()
//    print("In a triangle in which leg a = \(aLeg!), leg b = \(bLeg!):" +
//          "\nhypotenuse = \(hypotenuse)," +
//          "\nperimeter = \(rectanglePerimeter)," +
//          "\narea = \(rectangleArea).\n")
//// if one constant is equal to "nil" or 0, then the program will say about it and indicate in which specific constant it is necessary to write correct the data
//} else if aLeg == nil {
//    print("Leg a = nil, please enter a value for leg a.\n")
//    }
//if bLeg == nil {
//    print("Leg b = nil, please enter a value for leg b.\n")
//        }
//if aLeg == 0 {
//    print("Leg a = 0, please enter a right value for leg a.\n")
//        }
//if bLeg == 0 {
//    print("Leg b = 0, please enter a right value for leg b.\n")
//       }
//
//// 3rd "The user enters the amount of the deposit to the bank and the annual percentage. Find the deposit amount after 5 years"
//print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Given the legs of a right triangle. Find the area, perimeter and hypotenuse of a triangle. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
//print("Please use next format: 1 or 1.1 (for non-integer numbers, use a dot but" +
//      "not a not a comma to separate the integer and non-integer part.)\n")
//print("Enter the amount of the deposit please")
//let initialDepositFromUser = readLine()
//print("Enter annual percentage please")
//let annualPercentageFromUser = readLine()
//// using "if" and "Optional Binding" to safely get values ​​from keyboard input
//if let doubleDeposit = Double(initialDepositFromUser!), let doublePercentage = Double(annualPercentageFromUser!) {
//    let finalDeposit = doubleDeposit + doubleDeposit * (doublePercentage / 100) * 5
//    print("\ninitial deposit = \(doubleDeposit)," +
//          "\nannual percetage = \(doublePercentage)%," +
//          "\nafter five years the deposit will be = \(finalDeposit)," +
//          "\nprofit will be = \(finalDeposit - doubleDeposit).\n")
//// if the user does not enter numbers, the program will tell him about it. This is implemented for security. If this functionality is not implemented and the user enters something other than numbers, then the program will crash.
//} else {
//    print("\nYou had entered no number, please restart the program and enter a number." +
//          " Please use next format: 1 or 1.1 (for non-integer numbers, use a dot but" +
//          "not a not a comma to separate the integer and non-integer part.)\n")
//}








//var a = [1, 2, 3]
//if a.isEmpty == false{
//    print("123")
//    print(a)
//} else {
//    print("321")
//}
  

//func1 func checkDivisionBy3(number: Int) {
//    if number % 3 == 0 && number == 0 {
//        print("Dividing zero by any number gives a remainder of 0.")
//        break mainLooap
//    }
//    if number % 3 == 0 {
//        print("The number \(number) can be divisible by 3 without a remainder")
//    } else {
//        print("The number \(number) cannot be divisible by 3 without a remainder.")
//    }
//}

//func checkDivisionBy3(number: Int) {
//    switch number {
//    case _ where number % 3 == 0 && number == 0:
//        print("Dividing zero by any number gives a remainder of 0.")
//        break
//    case _ where number % 3 == 0:
//        print("The number \(number) can be divisible by 3 without a remainder")
//    case _ where number % 3 != 0:
//        print("The number \(number) cannot be divisible by 3 without a remainder.")
//    default:
//        print("An error has occurred.")
//    }
//    }
