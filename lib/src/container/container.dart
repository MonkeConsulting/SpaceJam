// Flutter
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";

// widget
import "container_child.dart";

/// [StatelessWidget] used inside the [SpaceJamContainer].
class SpaceJamContainer extends StatelessWidget {
  /// Constructor
  const SpaceJamContainer({
    required this.title,
    required this.child,
    this.pathToBackground,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  /// Child to pass on.
  final Widget child;

  /// Title displayed at the top.
  final String title;

  /// Path to the background.
  final String? pathToBackground;

  /// Background color.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final AutoSizeGroup contentBigTextSize = AutoSizeGroup();

    return SpaceJamContainerChild(child: Padding(
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
                  style: Theme.of(context).textTheme.headlineMedium,
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
                    color: backgroundColor,
                    image: pathToBackground != null ? DecorationImage(
                      image: AssetImage(pathToBackground!),
                      fit: BoxFit.cover,
                    ): null,
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
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),),
    );
  }
}
