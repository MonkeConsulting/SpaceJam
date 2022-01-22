//ignore_for_file: avoid_classes_with_only_static_members

// Flutter
import "package:flutter/material.dart";

/// [SpaceJamTextStyles] are commonly used [TextStyle]s made for
/// general use in all kinds of applications.
class SpaceJamTextStyles {
  /// TextStyle for titleMedium.
  static TextStyle? title(
    BuildContext context, {
    Color? color,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) =>
      Theme.of(context).textTheme.titleMedium ??
      const TextStyle().copyWith(
        fontSize: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            .06,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
      );

  /// TextStyle for titleSmall.
  static TextStyle? titleSmall(
    BuildContext context, {
    Color? color,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) =>
      Theme.of(context).textTheme.titleSmall ??
      const TextStyle().copyWith(
        fontSize: (MediaQuery.of(context).size.width +
                MediaQuery.of(context).size.height) /
            2 *
            .04,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
      );

  /// TextStyle for headlines.
  static TextStyle? headline(
    BuildContext context, {
    Color? color,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) =>
      Theme.of(context).textTheme.headlineMedium ??
      const TextStyle().copyWith(
        fontSize: MediaQuery.of(context).size.width * .08,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
      );

  /// TextStyle for headlineSmall.
  static TextStyle? headlineSmall(
    BuildContext context, {
    Color? color,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) =>
      Theme.of(context).textTheme.headlineSmall ??
      const TextStyle().copyWith(
        fontSize: MediaQuery.of(context).size.width * .05,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
      );

  /// TextStyle for bodyMedium.
  static TextStyle? bodyMedium(
    BuildContext context, {
    Color? color,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) =>
      Theme.of(context).textTheme.bodySmall ??
      const TextStyle().copyWith(
        fontSize: MediaQuery.of(context).size.height * .025,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
      );

  /// TextStyle for bodySmall.
  static TextStyle? bodySmall(
    BuildContext context, {
    Color? color,
    double? letterSpacing,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
  }) =>
      Theme.of(context).textTheme.bodySmall ??
      const TextStyle().copyWith(
        fontSize: MediaQuery.of(context).size.height * .02,
        color: color,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
      );
}
