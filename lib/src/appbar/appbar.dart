// Dart
import "dart:ui";

// Flutter
import "package:flutter/material.dart";
import "../theme/text_styles.dart";

// widgets
import "../private/min.dart";
import "appbar_action.dart";

/// The appbar widget.
class Appbar extends StatelessWidget {
  /// Constructor
  const Appbar({
    required this.title,
    this.subtitle,
    this.leftAction,
    this.rightAction,
    Key? key,
  }) : super(key: key);

  /// The title of the appbar.
  final String title;

  /// The subtitle of the appbar.
  final String? subtitle;

  /// The left tappable [AppBarAction].
  final AppBarAction? leftAction;

  /// The right tappable [AppBarAction].
  final AppBarAction? rightAction;

  @override
  Widget build(BuildContext context) {
    Widget subtitleWidget() {
      if (subtitle != null) {
        return Text(
          subtitle!,
          style: SpaceJamTextStyles.titleSmall(context),
        );
      } else {
        return const Min();
      }
    }

    return Container(
      alignment: Alignment.topLeft,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: (MediaQuery.of(context).size.height +
                MediaQuery.of(context).size.width) /
                2 *
                .02,
            sigmaY: (MediaQuery.of(context).size.height +
                MediaQuery.of(context).size.width) /
                2 *
                .02,
          ),
          child: Container(
            color: const Color.fromRGBO(255, 255, 255, .4),
            child: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .05,
                right: MediaQuery.of(context).size.width * .05,
              ),
              child: SafeArea(
                bottom: false,
                left: false,
                right: false,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * .05,
                    left: (MediaQuery.of(context).size.width +
                        MediaQuery.of(context).size.height) /
                        2 *
                        .04,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          leftAction != null ? leftAction! : const Min(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                title,
                                style: SpaceJamTextStyles.title(context),
                              ),
                              subtitleWidget(),
                            ],
                          ),
                        ],
                      ),
                      rightAction != null ? rightAction! : const Min(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
