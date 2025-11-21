
## Languages

To be able to use <kbd>⇧ Shift</kbd> and an English letter while in other languages that is RTL (Hebrew) select `Hebrew - PC` as the second language.
[Reference](https://superuser.com/questions/163414/mac-hebrew-english-uppercase/1256220#1256220)

## Show app switcher across all displays

[show app switcher across all displays](https://gist.github.com/jthodge/c4ba15a78fb29671dfa072fe279355f0)

```sh
defaults write com.apple.dock appswitcher-all-displays -bool true
killall Dock
```
