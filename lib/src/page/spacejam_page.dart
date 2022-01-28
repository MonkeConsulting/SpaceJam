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
    Key? key,
    this.theme,
    this.appBarLeftAction,
    this.appBarRightAction,
  }) : super(key: key);

  /// [SpaceJamTheme] to easily import the looks.
  final SpaceJamTheme? theme;

  /// Title of the page.
  final String title;

  /// [SpaceJamAppBarAction] to make an clickable
  /// [Icon] on the left of the appbar.
  final SpaceJamAppBarAction? appBarLeftAction;

  /// [SpaceJamAppBarAction] to make an clickable
  /// [Icon] on the right of the appbar.
  final SpaceJamAppBarAction? appBarRightAction;

  /// Children for passing it down in the widget tree as content of the page.
  final List<Widget> children;

  @override
  SpaceJamPageState createState() => SpaceJamPageState();
}

/// Stateful part of the widget.
class SpaceJamPageState extends State<SpaceJamPage> {
    final ScrollController _controller = ScrollController();

    @override
    Widget build(BuildContext context) => Scaffold(
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
                  const Opacity(
                    opacity: 0,
                    child: SpaceJamAppBar(
                      title: "SpaceJam",
                    ),
                  ),
                ...widget.children,
                ],
              ),
            ),
          ),
          SpaceJamAppBar(
            title: "SpaceJam",
            controller: _controller,
            leftAction: widget.appBarLeftAction,
            rightAction: widget.appBarRightAction,
          ),
        ],
      ),
    );
}
