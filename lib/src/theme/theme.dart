import "dart:ui";

/// Manager of the SpaceJam package. Used in SpaceJamApp.
class SpaceJamTheme {
  /// Constructor
  SpaceJamTheme(this.locale, this.pathToBackground, this.appName);

  /// Locale for the package's translations.
  Locale locale;

  /// Path to the background used across the package.
  String pathToBackground;

  /// Name of the app. Used in the promo widget.
  String appName;
}
