//
//  NotificationCreator.swift
//  Notifications
//
//  Created by frank on 7/27/25.
//

import SwiftUI

/// View for creating new yearly repeating notifications
/// Provides a date picker and creates notifications with default content
struct NotificationCreator: View {
    
    /// Access the shared notification manager from the environment
    @Environment(NotificationManager.self) var manager
    
    @State var title = ""
    @State var subtitle = ""
    @State var date = Date()
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .textFieldStyle(.roundedBorder)
            
            TextField("Subtitle", text: $subtitle)
                .textFieldStyle(.roundedBorder)
            
            DatePicker("Time & Date", selection: $date)
            
            Button("Set Notification", systemImage: "bell") { Task { await setNotification() } }
                .buttonStyle(.bordered)
                .tint(.accentColor)
                .symbolVariant(.fill)
        }
    }
    
    /// Creates a yearly notification for the selected date with default content
    /// Resets the date picker to current time after successful creation
    func setNotification() async {
        do {
            try await manager.createYearlyNotification(for: date, title: title, body: subtitle)
            reset()
        } catch {
            // Handle errors that may occur during scheduling
        }
    }
    
    /// Revert the input fields to their original values
    func reset() {
        title = ""
        subtitle = ""
        date = Date()
    }
}
