# settingup vscode custome file icon

Copy the svg file under `.vscode/extentions/icons`

in vscode `settings.json` file add the following:

example for changing json file icon

```json
"workbench.iconTheme": "material-icon-theme",
  "material-icon-theme.files.associations": {
    "*.json": "../../icons/json"
  },
```
