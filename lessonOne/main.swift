//
//  main.swift
//  lessonOne
//
//  Created by user on 4/12/22.
//

import Foundation

// 1st exercise "Solution of a quadratic equation."
// using Optional<Double> type to check to be able to check that all constants have values
print("▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Solution of a quadratic equation. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
let aCoefficient: Double? = 1
let bCoefficient: Double? = 5
let cCoefficient: Double? = 3
// using "if" to check that all constants have values
if (aCoefficient != nil) && (bCoefficient != nil) && (cCoefficient != nil) {
    let discriminant = pow(bCoefficient!, 2) - 4 * (aCoefficient!) * (cCoefficient!)
    // use "switch" to calculate the root, depending on the data, if there is a root. (I used "switch" because it requires less resources than "if". LET ME KNOW IF I AM WRONG!)
    switch discriminant {
    case _ where discriminant == 0:
        let x = (-bCoefficient!) / (2 * aCoefficient!)
        print("In the quadratic equation where:" +
              "\ncoefficient a = \(aCoefficient!)," +
              "\ncoefficient b = \(bCoefficient!)," +
              "\ncoefficient c = \(cCoefficient!)," +
              "\nthe discriminant = 0, the only one root = \(x).\n")
    case _ where discriminant > 1:
        let x1 = ((-bCoefficient! + sqrt(discriminant)) / (2 * aCoefficient!))
        let x2 = ((-bCoefficient! - sqrt(discriminant)) / (2 * aCoefficient!))
        print("In the quadratic equation where:" +
              "\ncoefficient a = \(aCoefficient!)," +
              "\ncoefficient b = \(bCoefficient!)," +
              "\ncoefficient c = \(cCoefficient!)," +
              "\nthe discriminant > 0, there are two roots.\nFirst root = \(x1), second root = \(x2).\n")
    case _ where discriminant < -1:
        print("In the quadratic equation where:" +
              "\ncoefficient a = \(aCoefficient!)," +
              "\ncoefficient b = \(bCoefficient!)," +
              "\ncoefficient c = \(cCoefficient!)," +
              "\nthe discriminant is negative, therefore there are no real roots.\n")
    default: print("There is some error in switch with discriminant")
    }
// if one coefficient is equal to "nil", then the program will say about it and indicate in which specific constant with the coefficient it is necessary to write the data
} else if aCoefficient == nil {
    print("Coefficient a = nil, please enter a value for coefficient a.\n")
    }
    if bCoefficient == nil {
        print("Coefficient b = nil, please enter a value for coefficient b.\n")
        }
    if cCoefficient == nil {
        print("Coefficient c = nil, please enter a value for coefficient c.\n")
        }

// 2nd exercise "Given the legs of a right triangle. Find the area, perimeter and hypotenuse of a triangle."
print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Given the legs of a right triangle. Find the area, perimeter and hypotenuse of a triangle. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
// using Optional<Double> type to check to be able to check that all constants have values
let aLeg: Double? = 15
let bLeg: Double? = 20
// using "if" to check that all constants have values and that they are not equal to 0
if aLeg != nil && bLeg != nil && aLeg != 0 && bLeg != 0 {
    let hypotenuse = (pow (aLeg!, 2) + pow (bLeg!, 2)).squareRoot()
    let rectanglePerimeter = aLeg! + bLeg! + hypotenuse
    var rectangleArea = (aLeg! + bLeg! + hypotenuse) / 2
    rectangleArea = (rectangleArea * (rectangleArea - aLeg!) * (rectangleArea - bLeg!) * (rectangleArea - hypotenuse)).squareRoot()
    print("In a triangle in which leg a = \(aLeg!), leg b = \(bLeg!):" +
          "\nhypotenuse = \(hypotenuse)," +
          "\nperimeter = \(rectanglePerimeter)," +
          "\narea = \(rectangleArea).\n")
// if one constant is equal to "nil" or 0, then the program will say about it and indicate in which specific constant it is necessary to write correct the data
} else if aLeg == nil {
    print("Leg a = nil, please enter a value for leg a.\n")
    }
if bLeg == nil {
    print("Leg b = nil, please enter a value for leg b.\n")
        }
if aLeg == 0 {
    print("Leg a = 0, please enter a right value for leg a.\n")
        }
if bLeg == 0 {
    print("Leg b = 0, please enter a right value for leg b.\n")
       }

// 3rd "The user enters the amount of the deposit to the bank and the annual percentage. Find the deposit amount after 5 years"
print("\n\n▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩ Given the legs of a right triangle. Find the area, perimeter and hypotenuse of a triangle. ▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩▩\n")
print("Please use next format: 1 or 1.1 (for non-integer numbers, use a dot but" +
      "not a not a comma to separate the integer and non-integer part.)\n")
print("Enter the amount of the deposit please")
let initialDepositFromUser = readLine()
print("Enter annual percentage please")
let annualPercentageFromUser = readLine()
// using "if" and "Optional Binding" to safely get values ​​from keyboard input
if let doubleDeposit = Double(initialDepositFromUser!), let doublePercentage = Double(annualPercentageFromUser!) {
    let finalDeposit = doubleDeposit + doubleDeposit * (doublePercentage / 100) * 5
    print("\ninitial deposit = \(doubleDeposit)," +
          "\nannual percetage = \(doublePercentage)%," +
          "\nafter five years the deposit will be = \(finalDeposit)," +
          "\nprofit will be = \(finalDeposit - doubleDeposit).\n")
// if the user does not enter numbers, the program will tell him about it. This is implemented for security. If this functionality is not implemented and the user enters something other than numbers, then the program will crash.
} else {
    print("\nYou had entered no number, please restart the program and enter a number." +
          " Please use next format: 1 or 1.1 (for non-integer numbers, use a dot but" +
          "not a not a comma to separate the integer and non-integer part.)\n")
}
