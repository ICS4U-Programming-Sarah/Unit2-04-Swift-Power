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
        print("Error: cannot access output file for writing.")
        exit(1)
    }

    // Read content from file.
    let inputData = input.readDataToEndOfFile()

    // Convert data to a string.
    guard let inputString = String(data: inputData, encoding: .utf8) else {
        print("Error: Cannot convert input data to string.")
        exit(1)
    }

    // Split string by newlines.
    let inputLines = inputString.components(separatedBy: .newlines)

    // Create  2D an array.
    var intLists: [[Int]] = []

    // Loop through each line of input.
    for line in inputLines {
        // Separate each line by spaces.
        let lineParts = line.components(separatedBy: " ")

        // Define empty list.
        var intList: [Int] = []

        // Loop through each part of the line.
        for part in lineParts {
            if let intValue = Int(part) {
                intList.append(intValue)
            } else {
                continue
            }
        }

        // Add the list of integers to the array.
        intLists.append(intList)
    }

    // Loop through each list of integers.
    for intList in intLists {
         
        if intList.count < 2 {
            // Display error message and skip this list.
            print("Invalid entry.")
            // Write to file.
            let data5 = Data(("Invalid entry." + "\n").utf8)
            output.write(data5)
            continue
        }

        // Access at index 0 & 1.
        let base = intList[0]
        let exp = intList[1]

        // Usage of if statement to determine
        // positive and negative values.
        if base >= 1 && exp >= 0 {
            // Calls the function.
            let recPower = recPow(base: base, exp: exp)

            // Display to user.
            print("The number \(base)^\(exp) is = \(recPower)")

            // Write results to the output file.
            let data3 = Data(("The number \(base)^\(exp) is = \(recPower)" + "\n").utf8)
            output.write(data3)
        } else {
            // Display error & writes to file.
            print("Please enter positive values.")
            let data4 = Data(("Invalid entry, positive values." + "\n").utf8)
            output.write(data4)
        }
    }
}
// This function calculates the power of a
// number recursively.
func recPow(base: Int, exp: Int) -> Int {
    // Defines base case.
    if exp == 0 {
        // Return a 1, if raised to 0.
        return 1
    } else {
        // Calls the function recursively & returns it.
        return base * recPow(base: base, exp: exp - 1)
    }
}

