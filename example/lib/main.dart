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
              fontWeight: FontWeight.bold,
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
        home: const HomePage(),
      );
}

/// Stateful part of the widget.
class HomePage extends StatefulWidget {
  /// Constructor
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

/// Stateful part of the Widget.
class HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollStartNotification ||
                    notification is ScrollUpdateNotification) {
                  setState(() {});
                }
                return true;
              },
              child: SingleChildScrollView(
                controller: _controller,
                child: Column(
                  children: <Widget>[
                    const Opacity(
                      opacity: 0,
                      child: Appbar(
                        title: "SpaceJam",
                      ),
                    ),
                    ContentBox(
                      title: "SpaceJam",
                      backgroundColor: Colors.blue,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: (MediaQuery.of(context).size.width +
                                    MediaQuery.of(context).size.height) /
                                2 *
                                .02,
                            right: (MediaQuery.of(context).size.width +
                                    MediaQuery.of(context).size.height) /
                                2 *
                                .02,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
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
                                style:
                                    SpaceJamTextStyles.headlineSmall(context),
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Button(
                          valueFontSize: 32,
                          titleFontSize: 24,
                          title: "Test",
                          value: "ImageViewer",
                          background: Colors.white24,
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
                    const SizedBox(
                      height: 0,
                    ),
                    Collection(
                      title: "Collection",
                      items: <CollectionItem>[
                        const CollectionItem(
                          backgroundColor: Colors.blue,
                          upperCaption: "caption",
                          upperValue: "value",
                          lowerCaption: "caption",
                          lowerValue: "value",
                        ),
                        const CollectionItem(
                          backgroundColor: Colors.blue,
                          upperCaption: "caption",
                          upperValue: "value",
                          lowerCaption: "caption",
                          lowerValue: "value",
                        ),
                        const CollectionItem(
                          backgroundColor: Colors.blue,
                          upperCaption: "caption",
                          upperValue: "value",
                          lowerCaption: "caption",
                          lowerValue: "value",
                        ),
                        CollectionItem(
                          backgroundColor: Colors.blue,
                          onTap: () {},
                          upperCaption: "caption",
                          upperValue: "value",
                          lowerCaption: "caption",
                          lowerValue: "value",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Appbar(
              title: "SpaceJam",
              controller: _controller,
              rightAction: const AppBarAction(
                icon: Icons.search,
              ),
            ),
          ],
        ),
      );
}
