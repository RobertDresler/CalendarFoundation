# CalendarFoundation
Simple Date selector for iOS apps

- Let user select certain day or not

---
### Install
**CocoaPods**
```Swift
pod 'CalendarFoundation'
```
---
### Usage
```Ruby
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

### Preview

<img width="508" alt="Screen Shot 2019-04-10 at 13 19 40" src="https://user-images.githubusercontent.com/40290767/55874699-6d162a00-5b93-11e9-8ea9-3a5992c10f47.png">
