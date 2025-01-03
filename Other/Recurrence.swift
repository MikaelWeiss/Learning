import Foundation

// MARK: - Recurrence Stuff

struct Recurrence {
    enum Frequency {
        case hourly
        case daily(Set<HoursOfTheDay>)
        case weekly(Set<DayOfTheWeek>)
        case monthly(MontlyRecurrence)
        case yearly(YearlyRecurrence)
        
        enum HoursOfTheDay: Int {
            case one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen, twenty, twentyone, twentytwo, twentythree
        }
        
        enum DayOfTheWeek {
            case sunday, monday, tuesday, wednesday, thursday, friday, saturday
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
