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
//let today = Date()

//let days = Date.intervalOf(component: .day, from: oneWeekAgo, to: today)
//print(days)

//let val = (days % 2)
//print(val)

let startDate = Date()
let rangeOfStart = Calendar.current.dateInterval(of: .day, for: startDate)!

//print(rangeOfStart.duration)

let todayy = Calendar.current.date(bySetting: .day, value: 2, of: Date())!
//print(Calendar.current.component(.day, from: todayy))

enum DayOfTheWeek: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
}

//print(DayOfTheWeek.monday.rawValue)

let cal = Calendar.current
let components = DateComponents(calendar: cal, year: 2020, month: 5, weekday: 1, weekOfMonth: 2)
let today = cal.date(from: components)!
//print(today)

extension DateFormatter {
    class var standard: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter
    }
}

extension Date {
    init?(dateString: String) {
        
        let dateFormatter = DateFormatter.standard
        var date: Date?
        let formats = ["MM/dd/yyyy", "M/dd/yyyy", "MM/d/yyyy", "M/d/yyyy", "dd MMM yyyy", "MM/dd/yyyy HH:mm:ss"]
        for format in formats {
            dateFormatter.dateFormat = format
            if let parsedDate = dateFormatter.date(from: dateString) {
                date = parsedDate
                break
            }
        }
        
        if let date = date {
            self = date
        } else {
            return nil
        }
    }
}

let morningDate = Date(dateString: "12/12/12 07:00:00")!
//print(Calendar.current.component(.hour, from: morningDate))

let noonDate = Date(dateString: "12/12/12 13:00:00")!
//print(Calendar.current.component(.hour, from: noonDate))

let nightDate = Date(dateString: "12/12/12 20:00:00")!
//print(Calendar.current.component(.hour, from: nightDate))

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MM/dd/yyyy HH:mm:ss"
let newDate = dateFormatter.date(from: "12/12/2012 7:00:00")!
//print(Calendar.current.component(.hour, from: newDate))
//print(dateFormatter.string(from: newDate))

//print(.nan + Decimal(8))

let size: CGFloat = 200
let minSize: CGFloat? = 16
let maxSize: CGFloat? = 16
let scaledSize = UIFontMetrics.default.scaledValue(for: size)

var finalSize: CGFloat {
    if let maxSize = maxSize, scaledSize > maxSize {
        return maxSize
    }
    if let minSize = minSize, scaledSize < minSize {
        return minSize
    }
    return scaledSize
}
//print(finalSize)

let givenID = UUID()
//print("StringWithID: \(givenID)")
//print("StringWithID: \(givenID.uuidString)")


struct Test {
    var val: String
}

var a = Test(val: "asdf") {
    didSet {
        print("DidSet ran Struct")
    }
}
a.val = "Some new value"

class Test2 {
    var val: String
    
    init(val: String) {
        self.val = val
    }
}

var b = Test2(val: "asdf") {
    didSet {
        print("DidSet ran Class")
    }
}
b.val = "Some new value"
