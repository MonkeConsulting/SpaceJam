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
          textTheme: SpaceJamTheme.textTheme(),
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
  @override
  Widget build(BuildContext context) => SpaceJamPage(
        title: "SpaceJam",
        appBarRightAction: const SpaceJamAppBarAction(Icons.search),
        children: <dynamic>[
          SpaceJamContainer(
            title: "SpaceJam",
            backgroundColor: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .02,
                ),
                SpaceJamImageBox(
                  Image.network(
                    "https://assets.4cdn.hu/kraken/6pI26jBO69hwv9c6s.jpeg",
                  ),
                ),
                SpaceJamButton(
                  valueFontSize: 32,
                  titleFontSize: 24,
                  title: "Test",
                  value: "ImageViewer",
                  background: Colors.white24,
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Widget>(
                        builder: (BuildContext context) => SpaceJamImagePage(
                          Image.network(
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
          SpaceJamImageBox(
            Image.network(
              "https://assets.4cdn.hu/kraken/6pI26jBO69hwv9c6s.jpeg",
            ),
            isInteractive: false,
          ),
          SpaceJamCollection(
            title: "Collection",
            items: <SpaceJamCollectionItem>[
              const SpaceJamCollectionItem(
                backgroundColor: Colors.blue,
                upperCaption: "caption",
                upperValue: "value",
                lowerCaption: "caption",
                lowerValue: "value",
              ),
              const SpaceJamCollectionItem(
                backgroundColor: Colors.blue,
                upperCaption: "caption",
                upperValue: "value",
                lowerCaption: "caption",
                lowerValue: "value",
              ),
              const SpaceJamCollectionItem(
                backgroundColor: Colors.blue,
                upperCaption: "caption",
                upperValue: "value",
                lowerCaption: "caption",
                lowerValue: "value",
              ),
              SpaceJamCollectionItem(
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
      );
  /*Scaffold(
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
                      child: SpaceJamAppBar(
                        title: "SpaceJam",
                      ),
                    ),
                    SpaceJamContainer(
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
                        SpaceJamButton(
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
                    SpaceJamCollection(
                      title: "Collection",
                      items: <SpaceJamCollectionItem>[
                        const SpaceJamCollectionItem(
                          backgroundColor: Colors.blue,
                          upperCaption: "caption",
                          upperValue: "value",
                          lowerCaption: "caption",
                          lowerValue: "value",
                        ),
                        const SpaceJamCollectionItem(
                          backgroundColor: Colors.blue,
                          upperCaption: "caption",
                          upperValue: "value",
                          lowerCaption: "caption",
                          lowerValue: "value",
                        ),
                        const SpaceJamCollectionItem(
                          backgroundColor: Colors.blue,
                          upperCaption: "caption",
                          upperValue: "value",
                          lowerCaption: "caption",
                          lowerValue: "value",
                        ),
                        SpaceJamCollectionItem(
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
            SpaceJamAppBar(
              title: "SpaceJam",
              controller: _controller,
              rightAction: const SpaceJamAppBarAction(
                icon: Icons.search,
              ),
            ),
          ],
        ),
      );*/
}
