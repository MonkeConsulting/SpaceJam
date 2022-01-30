// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/spacejam.dart";

void main() {
  group("Testing the SpaceJamPage widget.", () {
    testWidgets("SpaceJamPage with child property.",
            (WidgetTester tester) async {
          const Widget child = Text("child");

          await tester.pumpWidget(
            const MaterialApp(
              home: SpaceJamPage(
                title: "title",
                children: <Widget>[child],
              ),
            ),
          );

          // Search elements
          final Finder childFinder = find.byWidget(child);

          // Verify elements
          expect(childFinder, findsOneWidget);
        });
  });
}
