// Flutter
import "package:flutter/material.dart";

// widgets
import "collection_item.dart";
import "../private/min.dart";

/// Display a bunch of clickable options with or without a section title.
class Collection extends StatelessWidget {
  /// Constructor
  const Collection({required this.children, Key? key}) : super(key: key);

  /// List of [CollectionItem]s to display.
  final List<CollectionItem> children;

  @override
  Widget build(BuildContext context) => const Min();

}
