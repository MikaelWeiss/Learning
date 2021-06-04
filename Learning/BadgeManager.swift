//
//  BadgeManager.swift
//  Learning
//
//  Created by Mikael Weiss on 6/4/21.
//

import UIKit
import UserNotifications

enum BadgeManager {
    static func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: .badge) { granted, error in
            
        }
    }
    
    static func scheduleBadge() {
        let content = UNMutableNotificationContent()
        content.badge = 1
        
        let nextQuarterWindowStartDate = Date().addingTimeInterval(5)
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: nextQuarterWindowStartDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Badge", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        UNUserNotificationCenter.current().add(request)
    }
    
    static func removeAllNotifications() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
}
