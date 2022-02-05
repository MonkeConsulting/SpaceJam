// Flutter
import "package:flutter/material.dart";

// pages
import "../image_page/image_page.dart";
import "../container/container_info.dart";
import "../private/haptics.dart";
import "../private/min.dart";
import "../theme/theme.dart";

/// Localization strings
Map<String, Map<String, String>> _localization = <String, Map<String, String>>{
  "en": <String, String>{
    "fullscreen": "Fullscreen",
  },
  "hu": <String, String>{
    "fullscreen": "Teljes képernyő",
  },
  "de": <String, String>{
    "fullscreen": "Vollbild",
  },
  "da": <String, String>{
    "fullscreen": "Fuld skærm",
  }
};

/// List of supported locales.
List<Locale> _supportedLocales = const <Locale>[
  Locale("en"),
  Locale("hu"),
  Locale("de"),
  Locale("da"),
];

/// The astronomy picture of day widget. This shows the
/// image in a similar way like an item in a collection.
class SpaceJamImageBox extends StatelessWidget {
  /// Constructor
  const SpaceJamImageBox(
    this.image, {
    Key? key,
    this.imageURL,
    this.height,
    this.autoHeight = false,
    this.onTap,
    this.tooltip,
    this.isInteractive = true,
    this.semanticLabel,
  }) : super(key: key);

  /// Image to display.
  final Image image;

  /// Optional.
  /// URL of the image.
  final String? imageURL;

  /// Optional.
  /// Height of the widget. If null, the height will be set automatically.
  final double? height;

  /// Makes the widget as tall as it needs to be to. Will not show black bars.
  final bool autoHeight;

  /// Action when clicked.
  /// This will disable the default actions.
  final VoidCallback? onTap;

  /// Tooltip.
  final String? tooltip;

  /// A boolean which controls the default actions.
  /// Disabled id [onTap] is used.
  final bool isInteractive;

  /// Semantic label.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    /// Used if onTap is not given.
    final Locale? locale = SpaceJamTheme.of(context).locale;

    // height
    double? finalHeight;

    if (height != null && autoHeight) {
      Exception(
        "Do not provide both height and autoHeight. "
        "Will continue with autoHeight on.",
      );
    }

    if (height == null) {
      finalHeight = MediaQuery.of(context).size.height * .2;
    } else if (height! > 0) {
      // set height
      finalHeight = height;
    } else {
      Exception(
        "height is not valid. "
        "Please provide a nullable double, which is bigger than zero.",
      );
    }
    if (autoHeight) {
      finalHeight = null;
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            (SpaceJamContainerInfo.of(context) ? .0 : .02),
      ),
      child: SizedBox(
        width: SpaceJamContainerInfo.of(context)
            ? MediaQuery.of(context).size.width * .9
            : MediaQuery.of(context).size.width * .8,
        height: finalHeight,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(
              (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                  2 *
                  (SpaceJamContainerInfo.of(context) ? .02 : .04),
            ),
          ),
          child: Semantics(
            image: true,
            label: semanticLabel,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Container(
                  color: Colors.black,
                  child: Image(
                    image: image.image,
                    width: SpaceJamContainerInfo.of(context)
                        ? MediaQuery.of(context).size.width * .9
                        : MediaQuery.of(context).size.width * .8,
                    height: finalHeight,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  onTapUp: (_) {
                    hapticFeedback(context);
                    if (isInteractive && onTap == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => SpaceJamImagePage(
                            image,
                            imageURL: imageURL,
                            semanticLabel: semanticLabel,
                          ),
                        ),
                      );
                    }
                  },
                  child: onTap != null || isInteractive == true
                      ? Tooltip(
                          message: tooltip ??
                              _localization[(_supportedLocales.contains(locale)
                                      ? locale
                                      : _supportedLocales.first)!
                                  .languageCode]!["fullscreen"],
                          child: Padding(
                            padding: EdgeInsets.all(
                              (MediaQuery.of(context).size.width +
                                      MediaQuery.of(context).size.height) /
                                  2 *
                                  .03,
                            ),
                            child: Icon(
                              Icons.fullscreen,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.width * .075,
                            ),
                          ),
                        )
                      : const Min(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
