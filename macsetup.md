# TBD

## Config uk keyboard layout to us

| [Reference guide](https://apple.stackexchange.com/questions/281405/easy-way-to-remap-non-modifier-keys-on-mac) 

1. Copy `com.user.loginscript.plist` file into `~/Library/LaunchAgents/com.user.loginscript.plist`
2. Run `launchctl load ~/Library/LaunchAgents/com.user.loginscript.plist` 

This will change only the builtin mac keyboard. Incase you need to change also external keyboard layout remove those lines:

```xml
    <string>--matching</string>
    <string>{"Product":"Apple Internal Keyboard / Trackpad"}</string>
```

You can specify to which device you want to make the change by using `ProductID`