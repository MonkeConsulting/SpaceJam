// Flutter
import "package:flutter/material.dart";

// widgets
import "collection_item.dart";
import "../private/min.dart";

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
  Widget build(BuildContext context) =>  Wrap(
          spacing: MediaQuery.of(context).size.width * .0125,
          children: items,
      );
}
