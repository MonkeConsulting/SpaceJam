// Flutter
import "package:flutter/material.dart";

// widgets
import "collection_item.dart";
import "../private/min.dart";

// utils
import "../theme/text_styles.dart";

/// Display a bunch of clickable options with or without a section title.
class SpaceJamCollection extends StatelessWidget {
  /// Constructor
  const SpaceJamCollection({required this.items, Key? key, this.title})
      : super(key: key);

  /// List of [SpaceJamCollectionItem]s to display.
  final List<SpaceJamCollectionItem> items;

  /// Title of the collection
  final String? title;

  @override
  Widget build(BuildContext context) => items.isNotEmpty
      ? Padding(
          padding: EdgeInsets.only(
            bottom: (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                2 *
                .04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title != null
                  ? Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.width * .0125,
                        left: MediaQuery.of(context).size.width * .0225,
                      ),
                      child: Text(
                        title!,
                        style: SpaceJamTextStyles.headline(
                          context,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : const Min(),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: Wrap(
                  spacing: MediaQuery.of(context).size.width * .0225,
                  runSpacing: MediaQuery.of(context).size.width * .0225,
                  children: items,
                ),
              ),
            ],
          ),
        )
      : const Min();
}
