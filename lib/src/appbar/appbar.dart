// Dart
import "dart:ui";

// Flutter
import "package:flutter/material.dart";
import "../theme/text_styles.dart";

// widgets
import "../private/size_provider.dart";
import "../private/min.dart";
import "appbar_action.dart";

/// The appbar widget.
class Appbar extends StatefulWidget {
  /// Constructor
  const Appbar({
    required this.title,
    this.subtitle,
    this.leftAction,
    this.rightAction,
    this.controller,
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

  /// A [ScrollController] used to make the animations
  final ScrollController? controller;

  @override
  AppbarState createState() => AppbarState();
}

/// Stateful part of the Widget.
class AppbarState extends State<Appbar> {
  /// Double to store the widgets size.
  double widgetSize = 0;

  /// Returns the opacity of the appbar
  double appbarOpacity({required double offset, required double size}) {
    if (offset > size * .7) {
      return 1;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget subtitleWidget() {
      if (widget.subtitle != null) {
        return Text(
          widget.subtitle!,
          style: SpaceJamTextStyles.titleSmall(context),
        );
      } else {
        return const Min();
      }
    }

    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: SizeProviderWidget(
            onChildSize: (Size size) {
              widgetSize = size.height;
            },
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
                                widget.leftAction != null
                                    ? widget.leftAction!
                                    : const Min(),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    widget.controller != null ? AnimatedOpacity(
                                      opacity: appbarOpacity(
                                        offset: widget.controller!.offset,
                                        size: widgetSize,
                                      ),
                                      duration:
                                          const Duration(milliseconds: 150),
                                      child: Text(
                                        widget.title,
                                        style:
                                            SpaceJamTextStyles.title(context),
                                      ),
                                    ) : Text(
                                      widget.title,
                                      style:
                                      SpaceJamTextStyles.title(context),
                                    ),
                                    subtitleWidget(),
                                  ],
                                ),
                              ],
                            ),
                            widget.rightAction != null
                                ? widget.rightAction!
                                : const Min(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
