# TBD

## Languages
To be able to use <kbd>⇧ Shift</kbd> and an English letter while in other languages that is RTL (Hebrew) select `Hebrew - PC` as the second language.
[Reference](https://superuser.com/questions/163414/mac-hebrew-english-uppercase/1256220#1256220)

## Config uk keyboard layout to us

This approch doesn't work since macOs Sonoma 14.2.
The best alternative I could find is to use [Karabiner](https://karabiner-elements.pqrs.org/)

| [Reference guide](https://apple.stackexchange.com/questions/281405/easy-way-to-remap-non-modifier-keys-on-mac) 

1. Copy `com.user.loginscript.plist` file into `~/Library/LaunchAgents/com.user.loginscript.plist`
2. Run `launchctl load ~/Library/LaunchAgents/com.user.loginscript.plist` 

This will change only the builtin mac keyboard. Incase you need to change also external keyboard layout remove those lines:

```xml
    <string>--matching</string>
    <string>{"Product":"Apple Internal Keyboard / Trackpad"}</string>
```

You can specify to which device you want to make the change by using `ProductID`