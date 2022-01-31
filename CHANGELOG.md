# 1.0.3
* Added German and Danish locales.
#### Breaking changes:
Button:
- replaced `pathToBackground` property with `backgroundImage`.
  This used a `DecorationImage` instead of a string that contains the path to the image.
CollectionItem:
- replaced `pathToBackground` property with `backgroundImage`.
  This used a `DecorationImage` instead of a string that contains the path to the image.
Container:
- replaced `pathToBackground` property with `backgroundImage`.
  This used a `DecorationImage` instead of a string that contains the path to the image.
# 1.0.2
* Bugfixes
* Default locale if locale is not supported.
# 1.0.1
* Added `pathToBackground` property to SpaceJamButton.
# 1.0.0
* Added Content.
* Added ContentItem.
* Added SpaceJamPage.
* Added `duration` property to SpaceJamAppBar.

#### Breaking changes:
Appbar:
- Renamed `Appbar` to `SpaceJamAppBar`. 
AppBarAction:
- Renamed `AppBarAction` to `SpaceJamAppBarAction`.
- `icon` is now an unnamed parameter.
Button:
- Renamed `Button` to `SpaceJamButton`.
ContentBox:
- Renamed `ContentBox` to `SpaceJamContainer`.
ImagePage:
- Renamed `ImagePage` to `SpaceJamImagePage`.
- `image` is now an unnamed parameter.
# 0.2.2
* Bugfixes
# 0.2.1
* Bugfixes
# 0.2.0
* Appbar can be animated by providing a ScrollController to it.
#### Breaking changes:
Appbar:
- `background` is replaced with `pathToBackground`.
# 0.1.1
* More pub points.
# 0.1.0
* Added Appbar.
* Added AppBarAction.
* Added Button.
* Added ContentBox.
* Added SpaceJamTextStyles.
* Added SpaceJamTheme.
