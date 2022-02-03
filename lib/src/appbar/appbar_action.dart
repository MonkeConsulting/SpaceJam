// Flutter
import "package:flutter/material.dart";

// widgets
import "../private/haptics.dart";
import "appbar.dart";

/// An icon with onTap event used in the [SpaceJamAppBar].
class SpaceJamAppBarAction extends StatelessWidget {
  /// Constructor
  const SpaceJamAppBarAction(
    this.icon, {
    this.tooltip = "",
    this.action,
    Key? key,
  }) : super(key: key);

  /// [Icon] for the action.
  final IconData? icon;

  /// Tooltip when tapping the icon.
  final String? tooltip;

  /// Action that happens when tapping on the icon.
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: action,
        onTapUp: (_) {
          hapticFeedback(context);
        },
        child: Padding(
          padding: EdgeInsets.only(
            right: (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                2 *
                .04,
          ),
          child: Tooltip(
            message: tooltip,
            child: Icon(
              icon,
              size: MediaQuery.of(context).size.width * .075,
              color: Colors.black,
            ),
          ),
        ),
      );
}
