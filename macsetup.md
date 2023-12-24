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

## Keyboard customizations

Using [Karabiner](https://karabiner-elements.pqrs.org/) to turn the <kbd>⇪ Caps lock</kbd> to hyper key / <kbd>⎋ Escape</kbd> to switch beween apps directly.

I add 2 Complex modifications:

#### CapsLock to Hyper/Escape

```json
{
    "description": "CapsLock to Hyper/Escape",
    "manipulators": [
        {
            "from": {
                "key_code": "caps_lock",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "right_shift",
                    "modifiers": [
                        "right_command",
                        "right_control",
                        "right_option"
                    ]
                }
            ],
            "to_if_alone": [
                {
                    "key_code": "escape"
                }
            ],
            "type": "basic"
        }
    ]
}
```

### Hyper Application (held down hyper+g to Fn)

```json
{
    "description": "Hyper Application (held down hyper+g to Fn)",
    "manipulators": [
        {
            "from": {
                "key_code": "e",
                "modifiers": {
                    "mandatory": [
                        "right_command",
                        "right_control",
                        "right_shift",
                        "right_option"
                    ]
                }
            },
            "to": [
                {
                    "shell_command": "open -a 'finder'"
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "1",
                "modifiers": {
                    "mandatory": [
                        "right_command",
                        "right_control",
                        "right_shift",
                        "right_option"
                    ]
                }
            },
            "to": [
                {
                    "shell_command": "open -a 'warp'"
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "2",
                "modifiers": {
                    "mandatory": [
                        "right_command",
                        "right_control",
                        "right_shift",
                        "right_option"
                    ]
                }
            },
            "to": [
                {
                    "shell_command": "open -a 'Visual Studio Code'"
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "3",
                "modifiers": {
                    "mandatory": [
                        "right_command",
                        "right_control",
                        "right_option",
                        "right_shift"
                    ]
                }
            },
            "to": [
                {
                    "shell_command": "open -a 'Google Chrome'"
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "4",
                "modifiers": {
                    "mandatory": [
                        "right_command",
                        "right_control",
                        "right_option",
                        "right_shift"
                    ]
                }
            },
            "to": [
                {
                    "shell_command": "open -a slack"
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "5",
                "modifiers": {
                    "mandatory": [
                        "right_command",
                        "right_control",
                        "right_option",
                        "right_shift"
                    ]
                }
            },
            "to": [
                {
                    "shell_command": "open -a notion"
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "6",
                "modifiers": {
                    "mandatory": [
                        "right_command",
                        "right_control",
                        "right_option",
                        "right_shift"
                    ]
                }
            },
            "to": [
                {
                    "shell_command": "open -a music"
                }
            ],
            "type": "basic"
        },
        {
            "from": {
                "key_code": "f",
                "modifiers": {
                    "mandatory": [
                        "right_command",
                        "right_control",
                        "right_shift",
                        "right_option"
                    ]
                }
            },
            "to": [
                {
                    "shell_command": "open -b com.runningwithcrayons.Alfred-3"
                }
            ],
            "type": "basic"
        }
    ]
}
```
