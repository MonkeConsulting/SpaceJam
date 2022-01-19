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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Subtitle",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              "Headline",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Subheading",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "Body",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "Caption",
              style: Theme.of(context).textTheme.caption,
            ),
            Button(valueFontSize: 32, titleFontSize: 24, title: "Test", value: "ImageViewer", background: Colors.blue, action: (){
              Navigator.push(
                context,
                MaterialPageRoute<Widget>(
                  builder: (BuildContext context) => ImagePage(
                    locale: const Locale("en"),
                    image: Image.network("https://assets.4cdn.hu/kraken/6pI26jBO69hwv9c6s.jpeg"),
                    imageURL: "https://assets.4cdn.hu/kraken/6pI26jBO69hwv9c6s.jpeg",
                  ),
                ),
              );
            },),
          ],
        ),
      ),
    );
}
