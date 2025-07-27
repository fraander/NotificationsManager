//
//  ContentView.swift
//  Notifications
//
//  Created by frank on 7/22/25.
//

import SwiftUI

/// Main content view that combines notification creation and management.
/// Requests notification permissions when the view appears.
struct ContentView: View {
    
    /// Access the shared notification manager from the environment
    @Environment(NotificationManager.self) var manager
    
    var body: some View {
        VStack {
            NotificationCreator() // Top section: Create new notifications
            
            Divider()
            
            NotificationCenter() // Bottom section: View and manage existing notifications
        }
        .padding()
        .task { await manager.requestPermission() } // Request notification permissions when the view first appears
    }
}
