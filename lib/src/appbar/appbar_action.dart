// Flutter
import "package:flutter/material.dart";

// widgets
import "appbar.dart";

/// An icon with onTap event used in the [Appbar].
class AppBarAction extends StatelessWidget {
  /// Constructor
  const AppBarAction({
    required this.icon,
    this.tooltip = "",
    this.action,
    Key? key,
  }) : super(key: key);

  /// Icon of the action.
  final IconData icon;

  /// Tooltip when tapping the icon.
  final String? tooltip;

  /// Action that happens when tapping on the icon.
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: action,
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
