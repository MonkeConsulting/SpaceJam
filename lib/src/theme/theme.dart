// Flutter
import "package:flutter/material.dart";

/// Manager of the SpaceJam package. Used in SpaceJamApp.
class SpaceJamTheme {
  /// Constructor
  SpaceJamTheme({
    this.locale,
    this.pathToBackground,
    this.color = Colors.red,
    this.animated,
  }) : assert(
  animated == "system" || animated == "on" || animated == "off",
  'The property animated should be "system", "on" or "off". '
  'Got "$animated".',
  );

  /// Locale for the package's translations.
  Locale? locale;

  /// Path to the background used across the package.
  String? pathToBackground;

  /// UI color used across the package.
  Color? color;

  /// If a [ScrollController] is presented the Appbar can be animated.
  /// Default to system preferences.
  final String? animated;

  /// TextThemes used in SpaceJam.
  static TextTheme textTheme() => const TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          /* fontSize: (MediaQuery.of(context).size.width +
                 MediaQuery.of(context).size.height) /
                 2 * .06,
              */
          color: Colors.black,
        ),
        titleSmall: TextStyle(
          /* fontSize: (MediaQuery.of(context).size.width +
              MediaQuery.of(context).size.height) /
              2 * .04,
          */
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          //fontSize: MediaQuery.of(context).size.width * .08,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          //fontSize: MediaQuery.of(context).size.width * .05,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          //fontSize: MediaQuery.of(context).size.height * .025,
        ),
        bodySmall: TextStyle(
          color: Colors.white70,
          //fontSize: MediaQuery.of(context).size.height * .02,
        ),
      );
}
