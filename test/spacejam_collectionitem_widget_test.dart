// Flutter
import "package:flutter_test/flutter_test.dart";
import "package:flutter/material.dart";

import "package:spacejam/spacejam.dart";

void main() {
  group("Testing the SpaceJamCollectionItem widget.", () {
    testWidgets(
        "SpaceJamCollectionItem with all captions and value. "
        "Checks values and captions and if icon is present without an action.",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SpaceJamCollectionItem(
            upperCaption: "upperCaption",
            upperValue: "upperValue",
            lowerCaption: "lowerCaption",
            lowerValue: "lowerValue",
            tooltip: "tooltip",
          ),
        ),
      );

      // Search elements
      final Finder upperCaption = find.text("upperCaption");
      final Finder upperValue = find.text("upperValue");
      final Finder lowerCaption = find.text("lowerCaption");
      final Finder lowerValue = find.text("lowerValue");

      final Finder icon = find.byIcon(Icons.arrow_forward_rounded);

      // Verify
      expect(upperCaption, findsOneWidget);
      expect(upperValue, findsOneWidget);
      expect(lowerCaption, findsOneWidget);
      expect(lowerValue, findsOneWidget);

      expect(icon, findsNothing);
    });

    testWidgets("SpaceJamCollectionItem with action on tap.",
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: SpaceJamCollectionItem(
            upperValue: "upperValue",
            onTap: () {},
          ),
        ),
      );

      /// Search elements
      final Finder upperValue = find.text("upperValue");

      final Finder icon = find.byIcon(Icons.arrow_forward_rounded);

      // Verify
      expect(upperValue, findsOneWidget);

      expect(icon, findsOneWidget);
    });
  });

  testWidgets("SpaceJamCollectionItem with tooltip.",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SpaceJamCollectionItem(
          upperValue: "upperValue",
          tooltip: "tooltip",
        ),
      ),
    );

    /// Search elements
    final Finder tooltip = find.byTooltip("tooltip");

    // Verify
    expect(tooltip, findsOneWidget);
  });

  testWidgets("Testing semantics in SpaceJamCollectionItem.",
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SpaceJamCollectionItem(
          upperValue: "",
          semanticLabel: "semantic",
        ),
      ),
    );

    /// Search elements
    final Finder tooltip = find.bySemanticsLabel(
      RegExp("semantic"),
    );

    // Verify
    expect(tooltip, findsOneWidget);
  });
}
