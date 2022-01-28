import "dart:ui";

/// Manager of the SpaceJam package. Used in SpaceJamApp.
class SpaceJamTheme {
  /// Constructor
  SpaceJamTheme(this.locale, this.pathToBackground, this.color);

  /// Locale for the package's translations.
  Locale locale;

  /// Path to the background used across the package.
  String? pathToBackground;

  /// UI color used across the package.
  Color? color;
}
