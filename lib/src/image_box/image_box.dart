// Flutter
import "package:flutter/material.dart";
// import "package:flutter/services.dart";

// pages
import "../image_page/image_page.dart";
import "../container/container_child.dart";
import "../private/min.dart";

/// Localization strings
Map<String, Map<String, String>> _localization = <String, Map<String, String>>{
  "en": <String, String>{
    "fullscreen": "Fullscreen",
  },
  "hu": <String, String>{
    "fullscreen": "Teljes képernyő",
  }
};

/// List of supported locales.
List<Locale> _supportedLocales = const <Locale>[
  Locale("en"),
  Locale("hu"),
];

/// The astronomy picture of day widget. This shows the
/// image in a similar way like an item in a collection.
class SpaceJamImageBox extends StatelessWidget {
  /// Constructor
  SpaceJamImageBox(
    this.image, {
    Key? key,
    this.imageURL,
    this.onTap,
    this.tooltip,
    this.isInteractive = true,
    this.locale = const Locale("en"),
  })  : assert(
          _supportedLocales.contains(locale),
          "Locale is not supported.\n"
          "To add this locale head over to\n"
          "https://github.com/PrismForDart/SpaceJam/blob/main/doc/localisation.md.",
        ),
        super(key: key);

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

  /// Used if [onTap] is not given.
  final Locale? locale;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          bottom: (MediaQuery.of(context).size.width +
                  MediaQuery.of(context).size.height) /
              2 *
              (SpaceJamContainerChild.of(context) ? .0 : .04),
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
                    (SpaceJamContainerChild.of(context) ? .02 : .04),
              ),
            ),
          ),
          width: SpaceJamContainerChild.of(context)
              ? null
              : MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height * .2,
          child: Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                // TODO(KristofKekesi): Do the haptics.
                // HapticFeedback.selectionClick();
                if (onTap != null) {
                  onTap;
                } else if (isInteractive) {
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
                          _localization[locale?.languageCode]!["fullscreen"],
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
