// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/spacejam.dart";

void main() {
  group("Testing the button widget", () {
    testWidgets("Button where value is a string", (WidgetTester tester) async {
      bool variable = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Button(
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

      // Search elements
      final Finder titleFinder1 = find.text("title");
      final Finder valueFinder1 = find.text("value");

      // Verify elements
      expect(titleFinder1, findsOneWidget);
      expect(valueFinder1, findsOneWidget);

      // Check actions
      await tester.tap(find.byType(GestureDetector));
      expect(variable, true);
    });

    testWidgets("Button where value is a widget", (WidgetTester tester) async {
      const Widget child = Text("Widget");
      bool variable = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Button(
            titleFontSize: 16,
            valueFontSize: 16,
            title: "title",
            value: child,
            action: () {
              variable = true;
            },
          ),
        ),
      );

      // Search elements
      final Finder titleFinder = find.text("title");
      final Finder valueFinder = find.byWidget(child);

      // Verify elements
      expect(titleFinder, findsOneWidget);
      expect(valueFinder, findsOneWidget);

      // Check actions
      await tester.tap(find.byType(GestureDetector));
      expect(variable, true);
    });
  });
}
