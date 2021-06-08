//
//  BadgeView.swift
//  Learning
//
//  Created by Mikael Weiss on 3/4/21.
//

import SwiftUI
import UserNotifications

struct BadgeView: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                BadgeManager.requestPermission()
            }
            
            Button("Schedule Notification") {
                BadgeManager.scheduleBadge()
            }
            
            Button("Remove Notifications") {
                BadgeManager.removeAllNotifications()
            }
        }
    }
}

struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
