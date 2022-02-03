// Flutter
import "package:flutter/material.dart";

/// Custom decorated widget to display information.
class SpaceJamContainerInfo extends InheritedWidget {
  /// Constructor
  const SpaceJamContainerInfo({
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  /// Sets [isInContainer] to true for child widgets.
  //ignore:avoid_field_initializers_in_const_classes
  final bool isInContainer = true;

  /// Makes it simpler.
  static bool of(BuildContext context) {
    final SpaceJamContainerInfo? result =
        context.dependOnInheritedWidgetOfExactType<SpaceJamContainerInfo>();

    return result?.isInContainer ?? false;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
