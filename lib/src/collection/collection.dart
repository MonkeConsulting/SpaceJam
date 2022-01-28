// Flutter
import "package:flutter/material.dart";

// widgets
import "collection_item.dart";
import "../private/min.dart";

// utils
import "../theme/text_styles.dart";

/// Display a bunch of clickable options with or without a section title.
class Collection extends StatelessWidget {
  /// Constructor
  const Collection({required this.items, Key? key, this.title})
      : super(key: key);

  /// List of [CollectionItem]s to display.
  final List<CollectionItem> items;

  /// Title of the collection
  final String? title;

  @override
  Widget build(BuildContext context) => items.isNotEmpty
      ? Column(
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
            Wrap(
              spacing: MediaQuery.of(context).size.width * .0225,
              runSpacing: MediaQuery.of(context).size.width * .0225,
              children: items,
            ),
          ],
        )
      : const Min();
}
