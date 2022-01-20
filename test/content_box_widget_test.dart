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

      // Verify elements
      expect(titleFinder1, findsOneWidget);
      expect(childFinder, findsOneWidget);
    });

    const List<Widget> children = <Widget>[
      Text("first child of children"),
      Text("second child of children")
    ];

    testWidgets("Content box with children property",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ContentBox(
            title: "title",
            background: "",
            children: children,
          ),
        ),
      );

      // Search elements
      final Finder titleFinder = find.text("title");

      // Search and verify children
      for (int index = 0; index < children.length; index++) {
        final Finder childrenFinder = find.byWidget(children[index]);
        expect(childrenFinder, findsOneWidget);
      }

      // Verify elements
      expect(titleFinder, findsOneWidget);
    });
  });
}
