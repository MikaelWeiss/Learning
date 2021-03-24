import UIKit

var str = "Hello, playground"

enum RecurrenceEnd {
    case date(Date)
    case occurrenceCount(Int)
    case never
    static let rightAway = occurrenceCount(1)
}

let thing: RecurrenceEnd = .rightAway

//switch thing {
//case .date(_):
//    print("🔥")
//case .occurrenceCount(let count):
//    print(count)
//case .never:
//    print("🔥")
//}


extension Date {
    func lastDayOfYear() -> Date? {
        var components = Calendar.current.dateComponents([.year], from: self)
        guard let startDateOfYear = Calendar.current.date(from: components) else { return nil }
        components.year = 1
        components.day = -1
        let lastDayOfYear = Calendar.current.date(byAdding: components, to: startDateOfYear)
        return lastDayOfYear
    }
    
    static func lastDayOfYear(_ year: Int) -> Date {
        let components = DateComponents(year: year, month: 12, day: 31)
        return Calendar.current.date(from: components)!
    }
}

//print(Date().lastDayOfYear()! <= Date.lastDayOfYear(2020))

let arr = [1,3,2]
//print(arr.sorted())


let date2020 = Calendar.current.date(from: DateComponents(year: 2020))
let date2021 = Calendar.current.date(from: DateComponents(year: 2021))
let date2022 = Calendar.current.date(from: DateComponents(year: 2022))
var dateArr = [date2021!, date2022!, date2020!]
//print(dateArr.sorted(by: <))

extension Date {
    func numberOfDaysAgo(_ days: UInt16) -> Date {
        let cal = Calendar.current
        let day = cal.component(.day, from: self)
        let components = DateComponents(day: day - Int(days))
        return cal.date(from: components)!
    }
}

var date = Date().numberOfDaysAgo(5)
date.addTimeInterval(-1)
let hourAndMinute = Calendar.current.dateComponents([.hour, .minute], from: date)
//print(hourAndMinute)

extension Date {
    func adding(days: Int16) -> Date {
        let cal = Calendar.current
        let day = cal.date(byAdding: .day, value: Int(days), to: self)
        return day!
    }
    
    static func intervalOf(component: Calendar.Component, from startDate: Date, to endDate: Date) -> Int {
        let cal = Calendar.current
        let startDate = cal.startOfDay(for: startDate)
        let endDate = cal.startOfDay(for: endDate)
        
        guard let start = cal.ordinality(of: component, in: .era, for: startDate) else { return 0 }
        guard let end = cal.ordinality(of: component, in: .era, for: endDate) else { return 0 }
        
        return end - start
    }
}

let oneWeekAgo = Date().adding(days: -6)
let today = Date()

let days = Date.intervalOf(component: .day, from: oneWeekAgo, to: today)
print(days)

let val = (days % 2)
print(val)
