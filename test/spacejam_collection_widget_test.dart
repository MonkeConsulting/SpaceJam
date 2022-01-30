// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/spacejam.dart";

void main() {
  group("Testing the SpaceJamCollection widget.", () {
    testWidgets("Testing the SpaceJamCollection without any items.",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamCollection(
            title: "title",
            items: <SpaceJamCollectionItem>[],
          ),
        ),
      );

      // Search elements
      final Finder upperCaption = find.text("title");

      // Verify
      expect(upperCaption, findsNothing);
    });

    testWidgets("Testing the SpaceJamCollection with items.",
        (WidgetTester tester) async {
      const SpaceJamCollectionItem child =
          SpaceJamCollectionItem(upperValue: "upperValue");

      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamCollection(
            title: "title",
            items: <SpaceJamCollectionItem>[child, child],
          ),
        ),
      );

      // Search elements
      final Finder upperCaption = find.text("title");
      final Finder childFinder = find.byWidget(child);

      // Verify
      expect(upperCaption, findsOneWidget);
      expect(childFinder, findsNWidgets(2));
    });
  });
}
