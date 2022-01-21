// Flutter
import "package:flutter/material.dart";
import "package:flutter/services.dart";

// widgets
import "../private/min.dart";

Map<String, Map<String, String>> _localization = <String, Map<String, String>>{
  "en": <String, String>{
    "back": "Back",
    "copyURL": "Copy URL",
    "urlCopied": "URL copied!",
    "ok": "OK",
  }
};

/// Fullscreen image shower.
class ImagePage extends StatefulWidget {
  /// Constructor
  const ImagePage({
    required this.image,
    this.locale = const Locale("en", ""),
    this.imageURL,
    Key? key,
  }) : super(key: key);

  /// Image Widget
  final Image image;

  /// The url of the image. Optional.
  final String? imageURL;

  /// Locale used in localization.
  final Locale? locale;

  /// List of supported locales.
  static List<Locale> supportedLocales = const <Locale>[
    Locale("en", ""),
    Locale("de"),
    Locale("da"),
    Locale("hu"),
  ];

  @override
  ImagePageState createState() => ImagePageState();
}

/// The stateful part of the widget.
class ImagePageState extends State<ImagePage> {
  @override
  void initState() {
    if (!ImagePage.supportedLocales.contains(widget.locale)) {
      throw Exception(
        "Locale is not supported.\n"
        "To add this locale head over to\n"
        "https://github.com/PrismForDart/SpaceJam/blob/main/doc/localisation.md.",
      );
    }

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
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FloatingActionButton(
                  /// have to define heroTag because this widget uses
                  /// two [FloatingActionButton]-s which are making an
                  /// error because of their same default values.
                  heroTag: null,
                  backgroundColor: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip: _localization[widget.locale?.languageCode]!["back"],
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
                        /// have to define heroTag because this widget uses
                        /// two [FloatingActionButton]-s which are making an
                        /// error because of their same default values.
                        heroTag: null,
                        backgroundColor: Colors.black,
                        onPressed: () {
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
                                _localization[widget.locale?.languageCode]![
                                    "urlCopied"]!,
                              ),
                              action: SnackBarAction(
                                label: _localization[
                                    widget.locale?.languageCode]!["ok"]!,
                                onPressed: () {},
                              ),
                            ),
                          );
                        },
                        tooltip: _localization[widget.locale?.languageCode]![
                            "copyURL"],
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
        body: InteractiveViewer(
          minScale: 1,
          maxScale: 4,
          child: Align(
            child: widget.image,
          ),
        ),
      );
}
