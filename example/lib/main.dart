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
          textTheme: SpaceJamThemeData.textTheme(),
        ),
        //showSemanticsDebugger: true,
        debugShowCheckedModeBanner: false,
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
        appBarRightAction: const SpaceJamAppBarAction(
          Icons.search,
          semanticLabel: "Search between elements.",
        ),
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
                  semanticLabel: "Some gibbons having fun.",
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .02,
                ),
                SpaceJamButton(
                  valueFontSize: 32,
                  titleFontSize: 24,
                  title: "Test",
                  value: "ImagePage",
                  backgroundColor: Colors.white24,
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
                          semanticLabel: "Some gibbons having fun.",
                        ),
                      ),
                    );
                  },
                  semanticLabel: "Click to open the SpaceJamImagePage.",
                ),
              ],
            ),
          ),
          SpaceJamButton(
            valueFontSize: 32,
            titleFontSize: 24,
            title: "Test",
            value: "ImagePage",
            backgroundColor: Colors.blue,
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
                    semanticLabel: "Some gibbons having fun.",
                  ),
                ),
              );
            },
            semanticLabel: "Click to open the SpaceJamImagePage.",
          ),
          SpaceJamImageBox(
            Image.network(
              "https://assets.4cdn.hu/kraken/6pI26jBO69hwv9c6s.jpeg",
            ),
            isInteractive: false,
            semanticLabel: "Some gibbons having fun.",
          ),
          SpaceJamImageBox(
            Image.network(
              "https://assets.4cdn.hu/kraken/6pI26jBO69hwv9c6s.jpeg",
            ),
            isInteractive: false,
            autoHeight: true,
            semanticLabel: "Some gibbons having fun.",
          ),
          SpaceJamCollection(
            title: "Collection",
            items: <SpaceJamCollectionItem>[
              SpaceJamCollectionItem(
                backgroundColor: Colors.blue,
                upperCaption: "1st",
                upperValue: "Item",
                lowerCaption: "With",
                lowerValue: "Action",
                onTap: () {},
                semanticLabel: "First item. Click to perform action.",
              ),
              const SpaceJamCollectionItem(
                backgroundColor: Colors.blue,
                upperValue: "Item",
                lowerCaption: "Without",
                lowerValue: "Action",
                semanticLabel: "This text is customizable, use the "
                    "semanticLabel property if available.",
              ),
              const SpaceJamCollectionItem(
                backgroundColor: Colors.blue,
                upperCaption: "3rd",
                upperValue: "Item",
                lowerCaption: "Without",
                lowerValue: "Action",
                semanticLabel: "Make your apps available to "
                    "people with disabilities.",
              ),
              SpaceJamCollectionItem(
                backgroundColor: Colors.blue,
                onTap: () {},
                upperCaption: "4th",
                upperValue: "Item",
                lowerCaption: "With",
                lowerValue: "Action",
                semanticLabel: "Last item. Click to perform action.",
              ),
            ],
          ),
        ],
      );
}
