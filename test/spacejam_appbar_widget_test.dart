// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/spacejam.dart";

void main() {
  group("Testing the SpaceJamAppBar widget.", () {
    testWidgets("Testing title and subtitle.", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamAppBar(
            title: "title",
            subtitle: "subtitle",
          ),
        ),
      );

      // Search elements
      final Finder titleFinder = find.text("title");
      final Finder subtitleFinder = find.text("subtitle");

      // Verify
      expect(titleFinder, findsOneWidget);
      expect(subtitleFinder, findsOneWidget);
    });

    testWidgets(
        "Testing SpaceJamAppBarActions. "
        "Checking icons.", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamAppBar(
            title: "title",
            leftAction: SpaceJamAppBarAction(
              Icons.add,
              tooltip: "leftAction",
            ),
            rightAction: SpaceJamAppBarAction(
              Icons.remove,
              tooltip: "rightAction",
            ),
          ),
        ),
      );

      // Search elements
      final Finder leftIconFinder = find.byIcon(Icons.add);
      final Finder rightIconFinder = find.byIcon(Icons.remove);

      // Verify
      expect(leftIconFinder, findsOneWidget);
      expect(rightIconFinder, findsOneWidget);
    });

    testWidgets(
        "Testing SpaceJamAppBarActions. "
        "Checking actions and tooltips.", (WidgetTester tester) async {
      bool leftResult = false;
      bool rightResult = false;

      await tester.pumpWidget(
        MaterialApp(
          home: SpaceJamAppBar(
            title: "title",
            leftAction: SpaceJamAppBarAction(
              Icons.add,
              action: () {
                leftResult = true;
              },
              tooltip: "leftAction",
            ),
            rightAction: SpaceJamAppBarAction(
              Icons.remove,
              action: () {
                rightResult = true;
              },
              tooltip: "rightAction",
            ),
          ),
        ),
      );

      // Search elements
      final Finder leftTooltip = find.byTooltip("leftAction");
      final Finder rightTooltip = find.byTooltip("rightAction");

      // Check actions
      await tester.tap(find.byTooltip("leftAction"));
      expect(leftResult, true);

      await tester.tap(find.byTooltip("rightAction"));
      expect(rightResult, true);

      // Verify
      expect(leftTooltip, findsOneWidget);
      expect(rightTooltip, findsOneWidget);
    });

    testWidgets("Testing semantics in SpaceJamAppBar and SpaceJamAppBarAction.",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamAppBar(
            title: "title",
            leftAction: SpaceJamAppBarAction(
              Icons.add,
              semanticLabel: "leftAction",
            ),
            rightAction: SpaceJamAppBarAction(
              Icons.remove,
              semanticLabel: "rightAction",
            ),
          ),
        ),
      );

      // Search elements
      final Finder leftSemantic = find.bySemanticsLabel(
        RegExp("leftAction"),
      );
      final Finder rightSemantic = find.bySemanticsLabel(
        RegExp("rightAction"),
      );

      // Verify
      expect(leftSemantic, findsOneWidget);
      expect(rightSemantic, findsOneWidget);
    });
  });
}
