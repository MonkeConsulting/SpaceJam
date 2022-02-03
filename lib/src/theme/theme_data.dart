//ignore_for_file:avoid_classes_with_only_static_members

// Flutter
import "package:flutter/material.dart";

/// Manager of the SpaceJam package. Used in SpaceJamApp.
class SpaceJamThemeData {
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
