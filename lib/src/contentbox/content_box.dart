// Flutter
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";

// Widgets
import "../stylesheets/text_styles.dart";

/// Custom decorated widget to display information.
class ContentBox extends StatelessWidget {
  /// Constructor
  const ContentBox({
    required this.title,
    required this.background,
    this.child,
    this.children,
    Key? key,
  }) : super(key: key);

  /// Title displayed at the top.
  final String title;

  /// Path to the background
  final String background;

  /// Child of the widget.
  final Widget? child;

  /// Children of the widget.
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final AutoSizeGroup contentBigTextSize = AutoSizeGroup();

    return Padding(
      padding: EdgeInsets.only(
        top: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            .04,
        bottom: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            .04,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .04 +
                      MediaQuery.of(context).size.width * .05,
                ),
                child: AutoSizeText(
                  title,
                  style: SpaceJamTextStyles.headline(context),
                  maxLines: 1,
                  group: contentBigTextSize,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .05,
                  right: MediaQuery.of(context).size.width * .05,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(background),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            2 *
                            .04,
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * .9,
                  child: Padding(
                    padding: EdgeInsets.all(
                      (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: child != null
                          ? <Widget>[child!]
                          : children != null
                              ? children!
                              : <ErrorWidget>[
                                  ErrorWidget(
                                    "You must provide a Child or a Children "
                                    "property is not provided",
                                  )
                                ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
