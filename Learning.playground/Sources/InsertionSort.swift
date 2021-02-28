import Foundation

public func insertionSort<T: Comparable>(_ arrayToSort: [T], accending: Bool = true) -> [T] {
    var stackedArray = arrayToSort
    var sortedArray = [T]()
    
    while stackedArray.count > 0 {
        guard let item = stackedArray.popLast() else { break }
        sortedArray.insert(item, at: 0)
        
        for index in 0 ..< sortedArray.count {
            let itemInSortedArray = sortedArray[index]
            
            if accending {
                if item > itemInSortedArray {
                    sortedArray.swapAt(index, index - 1)
                }
            } else {
                if item < itemInSortedArray {
                    sortedArray.swapAt(index, index - 1)
                }
            }
        }
    }
    
    return sortedArray
}

public func insertionSort(_ array: [Int]) -> [Int] {
    var a = array             // 1
    for x in 1..<a.count {         // 2
        var y = x
        while y > 0 && a[y] < a[y - 1] { // 3
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}
