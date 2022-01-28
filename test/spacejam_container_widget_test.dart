// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/spacejam.dart";

void main() {
  group("Testing the SpaceJamContainer widget", () {
    testWidgets("SpaceJamContainer with child property",
        (WidgetTester tester) async {
      const Widget child = Text("child");

      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamContainer(
            title: "title",
            backgroundColor: Colors.blue,
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

    testWidgets("SpaceJamContainer with children property",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamContainer(
            title: "title",
            backgroundColor: Colors.blue,
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
