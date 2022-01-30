// Flutter
import "package:flutter/material.dart";

/// Custom decorated widget to display information.
class SpaceJamContainerChild extends InheritedWidget {
  /// Constructor
  const SpaceJamContainerChild({
    required Widget child,
    this.isInContainer = true,
    Key? key,
  }) : super(key: key, child: child);

  /// Sets [isInContainer] to true for child widgets.
  final bool isInContainer;

  /// Makes it simpler.
  static bool of(BuildContext context) {
    final SpaceJamContainerChild? result =
        context.dependOnInheritedWidgetOfExactType<SpaceJamContainerChild>();

    return result?.isInContainer ?? false;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
