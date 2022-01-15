// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/spacejam.dart";

void main() {
  group("Testing the contentBox widget", () {
    testWidgets("Content box with child property", (WidgetTester tester) async {
      const Widget child = Text("child");

      await tester.pumpWidget(
        const MaterialApp(
          home: ContentBox(
            title: "title",
            background: "",
            child: child,
          ),
        ),
      );

      // Search elements
      final Finder titleFinder1 = find.text("title");
      final Finder childFinder = find.byWidget(child);

      // Verify
      expect(titleFinder1, findsOneWidget);
      expect(childFinder, findsOneWidget);
    });
  });
}
