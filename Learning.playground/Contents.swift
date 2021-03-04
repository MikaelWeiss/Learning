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


// MARK: - Recurrence Stuff

struct Recurrence {
    enum Frequency {
        case hourly
        case daily
        case weekly(DailyRecurrence)
        case monthly(MontlyRecurrence)
        case yearly(YearlyRecurrence)
        
        struct DailyRecurrence {
            enum DayOfTheWeek {
                case sunday, monday, tuesday, wednesday, thursday, friday, saturday
            }
            var daysOfTheWeek: Set<DayOfTheWeek>
        }
        
        struct MontlyRecurrence {
            enum DayOfTheMonth {
                case dayOfTheMonth(Set<IntegerDayOfTheMonth>)
                case computedDayOfTheMonth(ComputedDayOfTheMonth)
                
                struct ComputedDayOfTheMonth {
                    enum ComputedDaysOfTheMonth {
                        case day
                        case weekday
                        case weekendDay
                    }
                    enum WeekOfTheMonth {
                        case first, second, third, fourth, fifth, last
                    }
                    var weekOfTheMonth: WeekOfTheMonth
                    var dayOfTheMonth: ComputedDaysOfTheMonth
                }
                
                struct IntegerDayOfTheMonth: Hashable {
                    private var day: Int
                    init() { self.day = 1 }
                    
                    var dayOfTheMonth: Int {
                        get { return day }
                        set {
                            if newValue > 0 && newValue < 31 {
                                day = newValue
                            }
                        }
                    }
                }
            }
            var recurrence: DayOfTheMonth
        }
        
        struct YearlyRecurrence {
            enum MonthOfTheYear {
                case january, february, march, april, may, june, july, august, september, october, november, december
            }
            var monthsOfTheYear: Set<MonthOfTheYear>
            var dayOfTheMonth: MontlyRecurrence.DayOfTheMonth
        }
    }
    
    enum RecurrenceEnd {
        case date(Date)
        case occurrenceCount(Int)
        case never
    }
    
    var frequency: Frequency
    var recurrenceEnd: RecurrenceEnd
    var interval: Int
}
