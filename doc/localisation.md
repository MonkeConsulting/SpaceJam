# Localization
To localize a SpaceJam widget you have 3 things to do.
### 1. What file does contain the widget?
To check the file that contains the widget you have to click on the Widget while pressing <kbd>command/control</kbd>.
#### What will be modified?
In the localizeable widget's file you can find the private `_localization` map, where you will be adding your localization. In this file, but deeper in the Widget's class you will find the static `supportedLocales` in this list you will add the new language's locale.

### 2. Add locale to supportedLocales
Firstly, you have to check if the locale you are wanting to add is listed. If not, you have to add a `Locale` to it. Dont worry there's a template for it, copy it from below.
```dart
Locale("your_new_locale"),
```

### 3. Add localization
To add a localization you have to add a new key to the `_localization` map. You can copy another language (e.g. english), then translate it to your desired language.

### 4. Make a PR
To finish it make a pr.
