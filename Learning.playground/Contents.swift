import SwiftUI

var queue = Queue<String>()

queue.enqueue("Something")
queue.enqueue("Something else")
print(queue)
print(queue.dequeue() ?? "")
