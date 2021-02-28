import SwiftUI


// MARK: - Queue
var queue = Queue<String>()

queue.enqueue("Something")
queue.enqueue("Something else")
//print(queue)
//print(queue.dequeue() ?? "")

// MARK: - Insertion Sort

let originalArray = [1, 6, 3, 8, 4, -1, 2, 9, 0, 11, 10, 7, 5]
print("originalArray count: \(originalArray.count)")

var stackedArray = originalArray

var sortedArray = insertionSort(originalArray, accending: false)
//print(sortedArray)
//print("sortedArray count: \(originalArray.count)")


// MARK: -

