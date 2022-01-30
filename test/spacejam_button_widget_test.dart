// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/spacejam.dart";

void main() {
  group("Testing the SpaceJamButton widget.", () {
    testWidgets("SpaceJamButton where value is a string.",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamButton(
            titleFontSize: 16,
            valueFontSize: 16,
            title: "title",
            value: "value",
          ),
        ),
      );

      // Search elements
      final Finder titleFinder1 = find.text("title");
      final Finder valueFinder1 = find.text("value");

      // Verify elements
      expect(titleFinder1, findsOneWidget);
      expect(valueFinder1, findsOneWidget);
    });

    testWidgets("SpaceJamButton where value is a widget. ",
        (WidgetTester tester) async {
      const Widget child = Text("Widget");

      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamButton(
            titleFontSize: 16,
            valueFontSize: 16,
            title: "title",
            value: child,
          ),
        ),
      );

      // Search elements
      final Finder titleFinder = find.text("title");
      final Finder valueFinder = find.byWidget(child);

      // Verify elements
      expect(titleFinder, findsOneWidget);
      expect(valueFinder, findsOneWidget);
    });

    testWidgets(
        "SpaceJamButton with tooltip. "
        "Check tooltip.", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SpaceJamButton(
            titleFontSize: 16,
            valueFontSize: 16,
            title: "title",
            value: "value",
            action: (){},
            tooltip: "tooltip",
          ),
        ),
      );

      // Search elements
      final Finder tooltipFinder = find.byTooltip("tooltip");

      // Verify elements
      expect(tooltipFinder, findsOneWidget);
    });

    testWidgets("SpaceJamButton where value is a widget. ",
        (WidgetTester tester) async {
      bool variable = false;

      await tester.pumpWidget(
        MaterialApp(
          home: SpaceJamButton(
            titleFontSize: 16,
            valueFontSize: 16,
            title: "title",
            value: "value",
            action: () {
              variable = true;
            },
          ),
        ),
      );

      // Check actions
      await tester.tap(find.byType(GestureDetector));
      expect(variable, true);
    });
  });
}
