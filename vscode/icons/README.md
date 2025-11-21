# settingup vscode custome file icon

## For using the [material icon theme](marketplace.cursorapi.com/items/?itemName=PKief.material-icon-theme)

Copy the svg file under `.vscode/extentions/icons` (or `.<any vscode fork>/extentions/icons`)
Note that the `icons` folder might not exist, so you need to create it.

in vscode `settings.json` file add the following:

example for changing json file icon

```json
"workbench.iconTheme": "material-icon-theme",
  "material-icon-theme.files.associations": {
    "*.json": "../../icons/json",
    "*.mdc": "../../icons/mdc"
  },
```
