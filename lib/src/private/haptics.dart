// Flutter
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

// widgets
import "../theme/theme.dart";

/// Returns haptic feedbacks if haptics are enabled.
void hapticFeedback(BuildContext context) {
  if (SpaceJamTheme.of(context).haptics ?? false) {
    HapticFeedback.selectionClick();
    if (kDebugMode) {
      print("Haptic feedback.");
    }
  }
}
