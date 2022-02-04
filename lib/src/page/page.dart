// Flutter
import "package:flutter/material.dart";

// widgets
import "../appbar/appbar_action.dart";
import "../appbar/appbar.dart";
import "../theme/theme.dart";

/// A general page with SpaceJamAppBar.
class SpaceJamPage extends StatefulWidget {
  /// Constructor
  const SpaceJamPage({
    required this.children,
    required this.title,
    this.animated = "system",
    this.haptics = true,
    this.locale,
    Key? key,
    this.appBarLeftAction,
    this.appBarRightAction,
  })  : assert(
          animated == "system" || animated == "on" || animated == "off",
          'The property animated should be "system", "on" or "off". '
          'Got "$animated".',
        ),
        super(key: key);

  /// To use animations or not.
  /// Acceptable values: "off", "on" and "system".
  final String animated;

  /// To use haptics or not.
  final bool? haptics;

  /// Language of widgets if available.
  final Locale? locale;

  /// Title of the page.
  final String title;

  /// [SpaceJamAppBarAction] to make an clickable
  /// [Icon] on the left of the appbar.
  final SpaceJamAppBarAction? appBarLeftAction;

  /// [SpaceJamAppBarAction] to make an clickable
  /// [Icon] on the right of the appbar.
  final SpaceJamAppBarAction? appBarRightAction;

  /// Children for passing it down in the widget tree as content of the page.
  final List<dynamic> children;

  @override
  SpaceJamPageState createState() => SpaceJamPageState();
}

/// Stateful part of the widget.
class SpaceJamPageState extends State<SpaceJamPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) => SpaceJamTheme(
        animated: widget.animated,
        haptics: widget.haptics,
        locale: widget.locale,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  if (notification is ScrollStartNotification ||
                      notification is ScrollUpdateNotification) {
                    setState(() {});
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: <Widget>[
                      Opacity(
                        opacity: 0,
                        child: SpaceJamAppBar(
                          title: widget.title,
                        ),
                      ),
                      ...widget.children,
                    ],
                  ),
                ),
              ),
              SpaceJamAppBar(
                title: widget.title,
                controller: _controller,
                leftAction: widget.appBarLeftAction,
                rightAction: widget.appBarRightAction,
              ),
            ],
          ),
        ),
      );
}
