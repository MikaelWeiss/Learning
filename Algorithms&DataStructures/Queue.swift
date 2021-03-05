import Foundation

public struct Queue<T> {
    private var queue = Array<T>()
    
    public init() { }
    
    public mutating func enqueue(_ item: T) {
        queue.append(item)
    }
    
    public mutating func dequeue() -> T? {
        queue.removeFirst()
    }
}
