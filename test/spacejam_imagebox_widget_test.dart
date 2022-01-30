// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

// Dart
import "dart:typed_data";
import "dart:convert";

import "package:spacejam/spacejam.dart";

const String image =
    "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";
Uint8List int8image = base64Decode(image);
final Image imageWidget = Image.memory(int8image);

void main() {
  group("Testing the SpaceJamImageBox widget.", () {
    testWidgets("SpaceJamImageBox with only an image.",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SpaceJamImageBox(
            imageWidget,
          ),
        ),
      );
    });
  });

  testWidgets(
      "SpaceJamImageBox with tooltip. "
      "Checks tooltip.", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SpaceJamImageBox(
          imageWidget,
          tooltip: "tooltip",
        ),
      ),
    );

    // Search elements
    final Finder tooltipFinder = find.byTooltip("tooltip");

    // Verify elements
    expect(tooltipFinder, findsOneWidget);
  });

  testWidgets(
      "SpaceJamImageBox with tooltip. "
      "Checks if icon is present without an action.",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SpaceJamImageBox(
          imageWidget,
          isInteractive: false,
        ),
      ),
    );

    // Search elements
    final Finder iconFinder1 = find.byIcon(Icons.arrow_forward_rounded);

    // Verify elements
    expect(iconFinder1, findsNothing);
  });
}
