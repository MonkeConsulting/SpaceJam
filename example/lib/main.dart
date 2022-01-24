// Flutter
import "package:flutter/material.dart";

// SpaceJam
import "package:spacejam/spacejam.dart";

void main() {
  runApp(const Example());
}

/// App
class Example extends StatelessWidget {
  /// Constructor
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "SpaceJam example",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // TextThemes
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              /* fontSize: (MediaQuery.of(context).size.width +
                 MediaQuery.of(context).size.height) /
                 2 * .06,
              */
              color: Colors.black,
            ),
            titleSmall: TextStyle(
              /* fontSize: (MediaQuery.of(context).size.width +
              MediaQuery.of(context).size.height) /
              2 * .04,
          */
              color: Colors.black,
            ),
            headlineMedium: TextStyle(
              //fontSize: MediaQuery.of(context).size.width * .08,
              color: Colors.black,
            ),
            headlineSmall: TextStyle(
              //fontSize: MediaQuery.of(context).size.width * .05,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              //fontSize: MediaQuery.of(context).size.height * .025,
            ),
            bodySmall: TextStyle(
              color: Colors.white70,
              //fontSize: MediaQuery.of(context).size.height * .02,
            ),
          ),
        ),
    home:HomePage(),
      );
}

/// Stateful part of the widget.
class HomePage extends StatefulWidget {
  /// Constructor
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GestureDetector(
          onVerticalDragUpdate: (_) {setState((){});},
          child: SingleChildScrollView(
            controller: _controller,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Appbar(
                    title: "SpaceJam Example",
                    controller: _controller,
                  ),
                  Text(
                    "Title",
                    style: SpaceJamTextStyles.title(context),
                  ),
                  Text(
                    "Subtitle",
                    style: SpaceJamTextStyles.titleSmall(context),
                  ),
                  Text(
                    "Headline",
                    style: SpaceJamTextStyles.headline(context),
                  ),
                  Text(
                    "Subheading",
                    style: SpaceJamTextStyles.headlineSmall(context),
                  ),
                  Text(
                    "Body",
                    style: SpaceJamTextStyles.bodyMedium(
                      context,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Caption",
                    style: SpaceJamTextStyles.bodySmall(
                      context,
                      color: Colors.black,
                    ),
                  ),
                  Button(
                    valueFontSize: 32,
                    titleFontSize: 24,
                    title: "Test",
                    value: "ImageViewer",
                    background: Colors.blue,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => ImagePage(
                            locale: const Locale("en"),
                            image: Image.network(
                              "https://assets.4cdn.hu/kraken/6pI26jBO69hwv9c6s.jpeg",
                            ),
                            imageURL:
                                "https://assets.4cdn.hu/kraken/6pI26jBO69hwv9c6s.jpeg",
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10000,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
