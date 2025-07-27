//
//  NotificationCenter.swift
//  Notifications
//
//  Created by frank on 7/27/25.
//

import SwiftUI

/// View that displays all pending notifications in a list with swipe-to-delete functionality
/// Automatically refreshes the notification list when the view appears
struct NotificationCenter: View {
    
    /// Access the shared notification manager from the environment
    @Environment(NotificationManager.self) var manager
    
    var body: some View {
        List(manager.pendingRequests, id: \.identifier) { request in
            NotificationRow(request: request)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    // Swipe-to-delete action for removing notifications
                    Button(role: .destructive) {
                        Task {
                            await manager.removePendingNotificationRequests(
                                withIdentifiers: [request.identifier]
                            )
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
        }
        // Refresh the notification list when the view first appears
        .task { await manager.updateNotifications() }
    }
}
