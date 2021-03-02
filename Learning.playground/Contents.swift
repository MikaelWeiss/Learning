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


// MARK: - SwiftUI Environment stuff

class ColorResolver {
    @Environment(\.backgroundColor) var backgroundColor: UIColor
}


private struct BackgroundEnvironmentKey: EnvironmentKey {
    static let defaultValue: UIColor = .blue
}

extension EnvironmentValues {
    var backgroundColor: UIColor {
        get { self[BackgroundEnvironmentKey.self] }
        set { self[BackgroundEnvironmentKey.self] = newValue }
    }
}

struct MyAwesomeTextField: View {
    @Binding var text: String
    
    var body: some View {
        let binding: Binding<String> = Binding(
            get: {
                text.capitalized
            },
            set: { val in
                text = val
            })
        TextField("Some awesome title", text: binding)
    }
}
