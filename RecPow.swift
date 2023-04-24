// This program reads information from line,
// it uses recursion to determine fibonacci
// sequences.

//
//  Created by Sarah Andrew

//  Created on 2023-04-19

//  Version 1.0

//  Copyright (c) 2023 Sarah. All rights reserved.
import Foundation
// Define input & output paths.
let inputFile = "input.txt"
let outputFile = "output.txt"

// Usage of file handle method to locate files,
// as well as opening input for file reading.
do {
    // Open input file for reading.
    guard let input = FileHandle(forReadingAtPath: inputFile) else {
        print("Error: cannot access input file for opening.")
        exit(1)
    }

    // Open output file for writing.
    guard let output = FileHandle(forWritingAtPath: outputFile) else {
        print("Error: cannot access output file for opening.")
        exit(1)
    }

    // Read context for file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string by newlines
    let inputLines = inputString.components(separatedBy: .newlines)

    // Convert from string of list to array of integers.
    // Creates a 2D array.
    var intLists: [[Int]] = []

    // Usage of loop to access each element,
    for line in inputLines {
        // Separating each element by spaces.
        let lineParts = line.components(separatedBy: " ")

        // Defining empty list.
        var intList: [Int] = []

        // Usage of loop to access each element,
        // then adding value to list.
        for part in lineParts {
            if let intValue = Int(part) {
                intList.append(intValue)
            //} else {
                //print("Please enter valid input.")
            }
        }

        intLists.append(intList)
    }

    // Accessing each element.
    for intList in intLists {
        let base = intList[0]
        let exp = intList[1]

        // If statement to determine negative inputs.
        if base >= 1 && exp >= 0 {
            // Call function.
            let recPower = recPow(base: base, exp: exp)

            // Display results.
            print("The number", base, terminator: "")
            print("^", exp, terminator: "")
            print(" is =", recPower)

            let data = Data("For following input, the power is = \(recPower)\n".utf8)
            output.write(data)
            
        } else {
            // Displays error to user.
            print("Please enter a positive number.")
            let data2 = Data("Please enter a positive number.".utf8)
            output.write(data2)
        }
    }
}
// This function uses recursion to
// calculate the power of a number.
func recPow(base: Int, exp: Int) -> Int {
    // Calculates a power to a num.
    // Define base cases
    if exp == 0 {
        // Return to main
        return 1
    } else {
        // Calls function recursively.
        return base * recPow(base: base, exp: exp - 1)
    }
}
