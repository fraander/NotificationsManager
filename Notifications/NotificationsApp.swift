//
//  NotificationsApp.swift
//  Notifications
//
//  Created by frank on 7/22/25.
//

import SwiftUI


/// Main app entry point for a notification management application.
///
/// This app demonstrates how to:
/// - Create and manage local notifications using UNUserNotificationCenter
/// - Share a notification manager across the app using SwiftUI's environment system
/// - Handle notification permissions and state management with @Observable
@main
struct NotificationsApp: App {
    /// Shared notification manager instance that handles all notification operations
    /// Uses @State to ensure the manager persists for the app's lifetime
    @State private var manager = NotificationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Inject the notification manager into the environment so all child views
            // can access it without explicit parameter passing
                .environment(manager)
        }
    }
}
