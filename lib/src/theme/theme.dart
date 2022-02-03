// Flutter
import "package:flutter/material.dart";

// widgets
import "../private/min.dart";

/// Custom decorated widget to display information.
class SpaceJamTheme extends InheritedWidget {
  /// Constructor
  const SpaceJamTheme({
    required Widget child,
    this.locale,
    this.animated = "system",
    this.haptics = true,
    Key? key,
  })  : assert(
          animated == "system" || animated == "on" || animated == "off",
          'The property animated should be "system", "on" or "off". '
          'Got "$animated".',
        ),
        super(key: key, child: child);

  /// Locale for down the widget tree.
  final Locale? locale;

  /// Controlling the appearances of
  /// animations down the widget tree.
  final String? animated;

  /// Turns the haptics on or off.
  final bool? haptics;

  /// Makes it simpler.
  static SpaceJamTheme of(BuildContext context) {
    final SpaceJamTheme? result =
        context.dependOnInheritedWidgetOfExactType<SpaceJamTheme>();

    return result ??
        const SpaceJamTheme(
          locale: Locale("en"),
          haptics: true,
          child: Min(),
        );
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
