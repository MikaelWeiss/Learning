import Foundation

public struct Stack<T> {
    private var stack = Array<T>()
    
    public init() { }
    
    public mutating func push(_ item: T) {
        stack.append(item)
    }
    
    public mutating func pop() -> T? {
        stack.popLast()
    }
    
    public mutating func drop() -> T {
        stack.removeLast()
    }
    
    public mutating func clear() {
        stack = Array<T>()
    }
}
