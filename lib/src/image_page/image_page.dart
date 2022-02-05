// Flutter
import "package:flutter/material.dart";
import "package:flutter/services.dart";

// widgets
import "../private/haptics.dart";
import "../private/min.dart";
import "../theme/theme.dart";

/// Localization strings
Map<String, Map<String, String>> _localization = <String, Map<String, String>>{
  "en": <String, String>{
    "back": "Back",
    "copyURL": "Copy URL",
    "urlCopied": "URL copied!",
    "ok": "OK",
  },
  "hu": <String, String>{
    "back": "Vissza",
    "copyURL": "URL másolása",
    "urlCopied": "URL kimásolva!",
    "ok": "OK",
  },
  "de": <String, String>{
    "back": "Zurück",
    "copyURL": "URL kopieren",
    "urlCopied": "URL kopiert!",
    "ok": "OK",
  },
  "da": <String, String>{
    "back": "Tillbage",
    "copyURL": "Kopier URL",
    "urlCopied": "URL kopieret!",
    "ok": "OK",
  }
};

/// List of supported locales.
List<Locale> _supportedLocales = const <Locale>[
  Locale("en"),
  Locale("hu"),
  Locale("de"),
  Locale("da"),
];

/// Fullscreen image shower.
class SpaceJamImagePage extends StatefulWidget {
  /// Constructor
  const SpaceJamImagePage(
    this.image, {
    this.imageURL,
    this.semanticLabel,
    Key? key,
  }) : super(key: key);

  /// Image Widget
  final Image image;

  /// The url of the image. Optional.
  final String? imageURL;

  /// Semantic label.
  final String? semanticLabel;

  @override
  SpaceJamImagePageState createState() => SpaceJamImagePageState();
}

/// The stateful part of the widget.
class SpaceJamImagePageState extends State<SpaceJamImagePage> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Locale used in localization.
    final Locale? locale = SpaceJamTheme.of(context).locale;

    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton(
                // Have to define heroTag because this widget uses
                // two [FloatingActionButton]-s which are making an
                // error because of their same default values.
                heroTag: null,
                backgroundColor: Colors.black,
                onPressed: () {
                  hapticFeedback(context);
                  Navigator.pop(context);
                },
                tooltip: _localization[(_supportedLocales.contains(locale)
                        ? locale
                        : _supportedLocales.first)!
                    .languageCode]!["back"],
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: MediaQuery.of(context).size.width * .075,
                  color: Colors.white,
                ),
              ),
            ),
            widget.imageURL != null
                ? Align(
                    alignment: Alignment.topRight,
                    child: FloatingActionButton(
                      // Have to define heroTag because this widget uses
                      // two [FloatingActionButton]-s which are making an
                      // error because of their same default values.
                      heroTag: null,
                      backgroundColor: Colors.black,
                      onPressed: () {
                        hapticFeedback(context);
                        Clipboard.setData(
                          ClipboardData(text: widget.imageURL),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.white10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            content: Text(
                              _localization[(_supportedLocales.contains(locale)
                                      ? locale
                                      : _supportedLocales.first)!
                                  .languageCode]!["urlCopied"]!,
                            ),
                            action: SnackBarAction(
                              label: _localization[
                                  (_supportedLocales.contains(locale)
                                          ? locale
                                          : _supportedLocales.first)!
                                      .languageCode]!["ok"]!,
                              onPressed: () {
                                hapticFeedback(context);
                              },
                            ),
                          ),
                        );
                      },
                      tooltip: _localization[(_supportedLocales.contains(locale)
                              ? locale
                              : _supportedLocales.first)!
                          .languageCode]!["copyURL"],
                      child: Icon(
                        Icons.link,
                        size: MediaQuery.of(context).size.width * .075,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const Min(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: Semantics(
        image: true,
        label: widget.semanticLabel,
        child: InteractiveViewer(
          minScale: 1,
          maxScale: 4,
          child: Align(
            child: widget.image,
          ),
        ),
      ),
    );
  }
}
