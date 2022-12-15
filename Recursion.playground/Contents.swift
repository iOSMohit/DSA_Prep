import UIKit

/// Questions for recursion

class Recursion {
    var keypadMapping:[Character: String] = ["0": ".", "1": "abc", "2": "def", "3": "ghi", "4":"jkl", "5":"mno", "6": "pqrs", "7": "tu", "8": "vwx", "9": "yz"]
    
    
    /// BASIC RECURSION PROBLEMS
    func printNumberDescending(number: Int) {
        if number == 0 {
            return
        }
        
        print(number)
        printNumberDescending(number: number-1)
    }
    func printNumberAscending(number: Int) {
        if number > 5 {
            return
        }
        
        print(number)
        printNumberAscending(number: number+1)
    }
    
    // Sum of n natural numbers
    func sumOfNaturalNumber(numberCount: Int, currentNumber: Int, sum: inout Int) {
        if currentNumber == numberCount {
            sum += currentNumber
            print(sum)
            return
        }
        
        sum += currentNumber
        sumOfNaturalNumber(numberCount: numberCount, currentNumber: currentNumber+1, sum: &sum)
    }
    
    // Calculate factorial of n
    func factorial(number: Int) -> Int {
        if number <= 0 {
            return 1
        }
        
        return number*factorial(number: number-1)
    }
    
    // Calculate fibonacci sequence till n
    func fib(firstTerm: Int, secondTerm: Int, number: Int) -> Int {
        if number == 0 {
            return 0
        }
        
        let nextTerm = firstTerm + secondTerm
        print(nextTerm)
        return fib(firstTerm: secondTerm, secondTerm: nextTerm, number: number - 1)
    }
    
    /// Print x^n
    func printPow(number: Int, power: Int) -> Int {
        if power == 0 {
            return 1
        }
        
        if number == 0 {
            return 1
        }
        
        if power.isEven {
            let nextPower = power/2
            let result = printPow(number: number, power: nextPower)
            return result*result
        } else {
            let nextPower = power/2
            let result = printPow(number: number, power: nextPower)
            return result*result*number
        }
    }
}

extension Int {
    var isEven: Bool {
        self%2 == 0
    }
}

let recursion = Recursion()


/// Print number in decreasing order
//recursion.printNumberDescending(number: 5)



/// Print number in increasing order
//recursion.printNumberAscending(number: 1)



/// Print sum of n natural numbers
//var sum = 0
//recursion.sumOfNaturalNumber(numberCount: 5, currentNumber: 1, sum: &sum)



/// Print factorial of nth number
//print(recursion.factorial(number: 5))



/// Fibonacci numbers
/// first term - 0 , second term - 1
//let nthTerm = 7
//let firstTerm = 0
//let secondTerm = 1
//print(firstTerm)
//print(secondTerm)
//_ = recursion.fib(firstTerm: 0, secondTerm: 1, number: nthTerm-2)



/// Print x^n
//recursion.printPow(number: 2, power: 5)


extension Recursion {
    /// RECURSION INTERMEDIATE PROBLEMS
    
    /// Tower of Hanoi
    func printTowerOfHanoi(numberOfDisks:Int, source: String, helper: String, destination: String) {
        if numberOfDisks == 1 {
            print("Transfer disk \(numberOfDisks) from \(source) to \(destination)")
            return
        }
        printTowerOfHanoi(numberOfDisks: numberOfDisks-1, source: source, helper: destination, destination: helper)
        print("Transfer disk \(numberOfDisks) from \(source) to \(destination)")
        printTowerOfHanoi(numberOfDisks: numberOfDisks-1, source: helper, helper: source, destination: destination)
    }
    
    /// Print string in reverse
    func printReverse(numbers: [Int], currentIndex: Int, size: Int) {
        print(currentIndex)
        if currentIndex == size-1 {
            print(numbers[currentIndex])
            return
        }
        
        printReverse(numbers: numbers, currentIndex: currentIndex+1, size: size)
        print(numbers[currentIndex])
    }
    
    
    /// Find first and last occurrence of ab element in the array
    static var firstOccurrence = -1
    static var lastOccurrence = -1
    func findFirstAndLastOccurrence(in array: [Int], of element: Int, currentIndex: Int, size: Int) {
        if currentIndex == size {
            return
        }
        
        if array[currentIndex] == element {
            if Recursion.firstOccurrence != -1 {
                Recursion.lastOccurrence = currentIndex
            } else {
                Recursion.firstOccurrence = currentIndex
            }
        }
        
        findFirstAndLastOccurrence(in: array, of: element, currentIndex: currentIndex+1, size: size)
    }
    
    
    /// Check if an array is sorted( Strictly increasing)
    func isSorted(arr: [Int], cIndex: Int, size: Int) -> Bool {
        if cIndex == size - 1 {
            return true
        }
        
        let currentItem = arr[cIndex]
        let nextItem = arr[cIndex+1]
        
        if currentItem >= nextItem {
            return false
        }
        return isSorted(arr: arr, cIndex: cIndex+1, size: size)
    }
    
    /// Move all 'x' to the end of the string
    func moveAll(element: Int,
                 in arr: inout [Int?], 
                 currentIndex: Int, 
                 count: inout Int, 
                 size: Int) {
        if currentIndex == size {
            var result = arr.compactMap({$0})
            for number in 0..<count {
                result.append(element)
            }
            print(result)
            return
        }
        if arr[currentIndex] == element {
            arr[currentIndex] = nil
            count += 1
        }
        
        moveAll(element: element, in: &arr, currentIndex: currentIndex+1, count: &count, size: size)
    }
    
    /// Remove duplicate in a array
    func removeDuplicate(in arr: inout [Int], 
                         currentIndex: Int,
                         map: inout [Bool],
                         result: inout [Int]) {
        if currentIndex == arr.count {
            return
        }
        if !map[arr[currentIndex]] {
            map[arr[currentIndex]] = true
            result.append(arr[currentIndex])
        } 
        
        removeDuplicate(in: &arr, currentIndex: currentIndex+1, map: &map, result: &result)
    }
    
    /// Print all the subsequences of a string
    func printSubSequences(of arr: [Character], currentIndex: Int, size: Int, result: [Character]) {
        if currentIndex == size {
            print(result)
            return
        }
        let currentChar = arr[currentIndex]
        var newResult = result
        newResult.append(currentChar)
        
        // When want to add current character
        printSubSequences(of: arr,
                          currentIndex: currentIndex+1,
                          size: size,
                          result: newResult)
        
        // When does not want to add
        printSubSequences(of: arr,
                          currentIndex: currentIndex+1,
                          size: size,
                          result: result)
    }
    
    /// Print all the unique subsequences of a character array - It will use same algorithm as above but It will use a dictionary and if values already in dictionary do not print it. Else add it dictionary and print it
    
    /// Print keypad combinations
    /// 0 -> .
    /// 1 -> abc
    /// 2 -> def
    /// 3 -> ghi
    /// 4 -> jkl
    /// 5 -> mno
    /// 6 -> pqrs
    /// 7 -> tu
    /// 8 -> vwx
    /// 9 -> yz
    func printCombinations(arr: [Character],
                           currentIndex: Int,
                           result: [Character]) {
        if currentIndex == arr.count {
            print(result)
            return
        }
        let currentCharacter = arr[currentIndex]
        if let value = keypadMapping[currentCharacter] {
            for char in value {
                var newResult = result
                newResult.append(char)
                printCombinations(arr: arr,
                                  currentIndex: currentIndex+1,
                                  result: newResult)
            }
        }
    }
}

/// Print tower of hanoi path
//recursion.printTowerOfHanoi( numberOfDisks: 3,
//                            source: "Source",
//                            helper: "Helper",
//                            destination: "Destination")


/// Print array in reverse order
//recursion.printReverse(numbers: [1,2,3,4,5], currentIndex: 0, size: 5)


/// Find first and last occurrence in the array of an element
//let array = [1,2,3,4,5,1,12,321,14,2,2,1]
//recursion.findFirstAndLastOccurrence(in: array, of: 1, currentIndex: 0, size: array.count)
//print(Recursion.firstOccurrence)
//print(Recursion.lastOccurrence)


/// Check array is sorted
//recursion.isSorted(arr: [1,2,3,4,5,6], cIndex: 0, size: 6)


// Move all '1' to the end of the array
//var arr: [Int?] = [1,2,3,3,1,2,5,34,1,2,4]
//var count = 0
//recursion.moveAll(element: 1, in: &arr, currentIndex: 0, count: &count, size: arr.count)


/// Remove duplicate from array
//var arr = [1,2,3,4,1,2,3,11,2,3,1,42,5,15,15]
//var map = [Bool](repeating: false, count: 1000005)
//var result = [Int]()
//recursion.removeDuplicate(in: &arr, currentIndex: 0, map: &map, result: &result)
//print(result)


/// Print all subsequence of a character array
//recursion.printSubSequences(of: ["A","B","C"], currentIndex: 0, size: 3, result: [])


/// Print all keypad combination
//var result = [Character]()
//recursion.printCombinations(arr: ["2","3"], currentIndex: 0, result: result)


extension Recursion {
    /// ADVANCE RECURSION PROBLEMS
    
    /// Print all permutations of a string
    func printAllPermutations(of arr: [Character],
                              size: Int, result: [Character]) {
        if arr.isEmpty {
            print(result)
            return
        }
        for (index, char) in arr.enumerated() {
            var newResult = result
            newResult.append(char)
            
            var updateArr = arr
            updateArr.remove(at: index)
            printAllPermutations(of: updateArr, size: size, result: newResult)
        }
    }
    
    /// Count total no of paths from start to end of the matrix. Only right and down movement is allowed
    func countPaths(row: Int, column: Int, rowSize: Int, columnSize: Int, totalPaths: inout Int) {
        // Can not move further
        if row == rowSize || column == columnSize {
            return
        }
        
        // Reached to the end
        if row == rowSize-1 && column == columnSize - 1 {
            totalPaths += 1
            return
        }
        
        // Move right
        countPaths(row: row, column: column+1, rowSize: rowSize, columnSize: columnSize, totalPaths: &totalPaths)
        
        // Move down
        countPaths(row: row+1, column: column , rowSize: rowSize, columnSize: columnSize, totalPaths: &totalPaths)
    }
    
    /// Find the number of ways in which you can invite n people to your party, single or pairs
    func callGuest(numberOfGuests: Int) -> Int {
        if numberOfGuests <= 1 {
            return 1
        }
        
        let noOfWaysToCallOneGuest = callGuest(numberOfGuests: numberOfGuests-1)
        let noOfWaysToCallGuestInPair = (numberOfGuests-1)*(callGuest(numberOfGuests: numberOfGuests-2))
        
        return noOfWaysToCallOneGuest+noOfWaysToCallGuestInPair
    }
    
    /// Print all the subset of a set of first n natural numbers
    func printSubSet(of n: Int, result: [Int]) {
        if n == 0 {
            print(result)
            return
        }
        
        // Add number
        var newResult = result
        newResult.append(n)
        printSubSet(of: n-1, result: newResult)
        
        // Skip this number
        newResult.removeLast()
        printSubSet(of: n-1, result: newResult)
    }
    
    /// Place tiles of size 1*m in a floor of size n*m
    func placeTile(row: Int, column: Int) -> Int {
        if row == column {
            return 2
        }
        
        if row < column {
            return 1
        }
        
        // Place vertically
        let verticalPlacements = placeTile(row: row-column, column: column)
        
        // Place horizontally
        let horizontalPlacements = placeTile(row: row-1, column: column)
        
        return verticalPlacements+horizontalPlacements
    }
}

/// Print all permutations of a string
//var result = [Character]()
//recursion.printAllPermutations(of: ["a","b","c"], size: 3, result: result)


/// Count total no of paths from start to end of the matrix
//var totalPaths = 0
//recursion.countPaths(row: 0, column: 0, rowSize: 3, columnSize: 3, totalPaths: &totalPaths)
//print(totalPaths)


/// Find the number of ways in which you can invite n people to your party, single or pairs
//let totalNoOfWays = recursion.callGuest(numberOfGuests: 4)
//print(totalNoOfWays)


/// Print all the subset of a set of first n natural numbers
//recursion.printSubSet(of: 3, result: [])


/// Place tiles of size 1*m in a floor of size n*m
let totalWays = recursion.placeTile(row: 4, column: 2)
print(totalWays)
