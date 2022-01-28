// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/spacejam.dart";

void main() {
  group("Testing the appbar widget", () {
// Appbar
    testWidgets("AppBar", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamAppBar(
            title: "title",
            subtitle: "subtitle",
            leftAction: SpaceJamAppBarAction(icon: Icons.add),
            rightAction: SpaceJamAppBarAction(icon: Icons.remove),
          ),
        ),
      );

// Search elements
      final Finder titleFinder = find.text("title");
      final Finder subtitleFinder = find.text("subtitle");
      final Finder leftIconFinder = find.byIcon(Icons.add);
      final Finder rightIconFinder = find.byIcon(Icons.remove);

// Verify
      expect(titleFinder, findsOneWidget);
      expect(subtitleFinder, findsOneWidget);
      expect(leftIconFinder, findsOneWidget);
      expect(rightIconFinder, findsOneWidget);
    });
  });
}
