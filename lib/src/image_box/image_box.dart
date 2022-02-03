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
    this.onTap,
    this.tooltip,
    this.isInteractive = true,
  }) : super(key: key);

  /// Image to display.
  final Image image;

  /// Optional.
  /// URL of the image.
  final String? imageURL;

  /// Action when clicked.
  /// This will disable the default actions.
  final VoidCallback? onTap;

  /// Tooltip.
  final String? tooltip;

  /// A boolean which controls the default actions.
  /// Disabled id [onTap] is used.
  final bool isInteractive;

  @override
  Widget build(BuildContext context) {
    /// Used if [onTap] is not given.
    final Locale? locale = SpaceJamTheme.of(context).locale;

    return Padding(
      padding: EdgeInsets.only(
        bottom: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            (SpaceJamContainerInfo.of(context) ? .0 : .02),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: image.image),
          borderRadius: BorderRadius.all(
            Radius.circular(
              (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                  2 *
                  (SpaceJamContainerInfo.of(context) ? .02 : .04),
            ),
          ),
        ),
        width: SpaceJamContainerInfo.of(context)
            ? null
            : MediaQuery.of(context).size.width * .8,
        height: MediaQuery.of(context).size.height * .2,
        child: Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
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
        ),
      ),
    );
  }
}
