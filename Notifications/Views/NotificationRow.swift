//
//  NotificationRow.swift
//  Notifications
//
//  Created by frank on 7/27/25.
//

import SwiftUI

/// A row view that displays notification information including identifier and next fire date
/// Used in lists to show pending notifications with their scheduling details
struct NotificationRow: View {
    /// The notification request to display information for
    let request: UNNotificationRequest
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Display the notification's unique identifier
            Text(request.identifier)
                .font(.headline)
            
            // Show when the notification will next trigger
            if let nextDate = request.nextFireDate {
                Text(nextDate, style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(nextDate, style: .time)
                    .font(.caption)
                    .foregroundColor(.secondary)
            } else {
                // Fallback for notifications without calendar triggers
                Text("No trigger date")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}
