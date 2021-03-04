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
        case daily(DailyRecurrence)
        case weekly(WeeklyRecurrence)
        case monthly(MontlyRecurrence)
        case yearly(YearlyRecurrence)
        
        struct DailyRecurrence {
            enum HoursOfTheDay: Int {
                case one, two, three, four, five, six, seven, eight, nine, ten
                case eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty
                case twentyone, twentytwo, twentythree
            }
            var hoursOfTheDay: Set<HoursOfTheDay>
        }
        
        struct WeeklyRecurrence {
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
                    init() { day = 1 }
                    
                    var dayOfTheMonth: Int {
                        get { return day }
                        set {
                            day = newValue.residesInRange(min: 0, max: 31, default: day)
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
    
    struct Interval {
        private var interval: Int
        init(interval: Int = 1) {
            self.interval = interval.residesInRange(min: 0, max: 999, default: interval)
        }
        
        var value: Int {
            get { interval }
            set {
                self.interval = newValue.residesInRange(min: 0, max: 999, default: 1)
            }
        }
    }
    
    var frequency: Frequency
    var recurrenceEnd: RecurrenceEnd
    var interval: Interval
}

let firstRecurrence = Recurrence(
    frequency: .monthly(.init(recurrence: .computedDayOfTheMonth(.init(weekOfTheMonth: .second, dayOfTheMonth: .weekday)))),
    recurrenceEnd: .occurrenceCount(25),
    interval: .init())

extension Int {
    func residesInRange(min: Int, max: Int, default: Int) -> Int {
        if self > min && self < max {
            return self
        } else {
            return `default`
        }
    }
}
