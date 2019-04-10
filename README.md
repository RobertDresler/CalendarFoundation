# CalendarFoundation
Simple date selector for iOS apps based on Swift. Let user select certain day from calendar (or not).

---
### Install
**CocoaPods**
```ruby
pod 'CalendarFoundation'
```
---
### Usage
```swift
import CalendarFoundation
    
// Initialize new instance of controller with `dateSelectedBlock`
let calendarVC = CalendarViewController(dateSelectedBlock: { [weak self] date in
    if let date = date {
        // work with received `Date`
    } else {
        // user selected option "Remove date" = `date` is `nil`
    }
})
    
// From you `UIViewController` present it
present(calendarVC, animated: true)
```
---
### UX
- Swipe for changing month
- Tap on day to select `Date`
- Tap to Remove date to return `nil`
- Tap anywhere to dismiss calendar
---

### Preview

<img width="508" alt="Screen Shot 2019-04-10 at 13 19 40" src="https://user-images.githubusercontent.com/40290767/55874699-6d162a00-5b93-11e9-8ea9-3a5992c10f47.png">
