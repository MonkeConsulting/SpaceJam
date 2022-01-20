// Flutter
import "package:flutter/material.dart";

// SpaceJam
import "package:spacejam/spacejam.dart";

void main() {
  runApp(const MyApp());
}

/// App
class MyApp extends StatelessWidget {
  /// Constructor
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "SpaceJam example",
        home: const MyHomePage(),
        theme: ThemeData(
          primarySwatch: Colors.red,
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
      );
}

/// Stateful part of the widget.
class MyHomePage extends StatelessWidget {
  /// Constructor
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("SpaceJam example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Title",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .06,
                    ),
              ),
              Text(
                "Subtitle",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          2 *
                          .04,
                    ),
              ),
              Text(
                "Headline",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: MediaQuery.of(context).size.width * .08,
                    ),
              ),
              Text(
                "Subheading",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: MediaQuery.of(context).size.width * .05,
                    ),
              ),
              Text(
                "Body",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: MediaQuery.of(context).size.height * .025,
                    color: Colors.black,),
              ),
              Text(
                "Caption",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: MediaQuery.of(context).size.height * .02,
                    color: Colors.black,),
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
            ],
          ),
        ),
      );
}
