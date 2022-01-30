// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/src/private/size_provider.dart";

void main() {
  group("Testing the internal SizeProvider widget.", () {
    testWidgets("SizeProvider", (WidgetTester tester) async {
      late Size widgetSize;
      const Widget child = SizedBox(
        width: 15,
        height: 30,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizeProviderWidget(
              onChildSize: (Size size) {
                widgetSize = size;
              },
              child: child,
            ),
          ),
        ),
      );

      // Search elements
      final Finder childFinder = find.byWidget(child);

      // Verify
      expect(childFinder, findsOneWidget);
      expect(widgetSize, const Size(15, 30));
    });
  });
}
