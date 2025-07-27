# Notifications Manager Proof-of-Concept

A SwiftUI proof-of-concept for creating and managing yearly repeating local notifications. This is a starter template demonstrating modern iOS patterns with `@Observable` - customize the notification content, UI, and functionality for your specific use case.

Perfect for birthday reminders, anniversaries, or any recurring yearly events.

## Included Features

- Create yearly repeating notifications
- Swipe-to-delete notification management
- Automatic permission handling
- Accurate next fire date calculations

## Usage

1. Grant notification permissions (automatic prompt)
2. Select date/time with date picker
3. Tap "Set" to create yearly notification
4. Swipe notifications to delete

## How It Works

### Yearly Repetition with `repeats: true`
Notifications repeat yearly by omitting the year component:

```swift
func createYearlyTrigger(for date: Date) -> UNCalendarNotificationTrigger {
    let dateComponents = calendar.dateComponents([.month, .day, .hour, .minute], from: date)
    return UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
}
```

### Automatic Updates with Observable
The `@Observable` manager automatically updates UI when notifications change:

```swift
func add(_ request: UNNotificationRequest) async throws {
    try await center.add(request)
    await updateNotifications() // Refreshes pendingRequests array
}
```

### Organization
- **NotificationManager**: `@Observable` class handling all notification operations
- **Environment Injection**: Shared manager across views
- **Extensions**: Utility methods for next fire date calculations

