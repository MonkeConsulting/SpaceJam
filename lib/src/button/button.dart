// Flutter
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";

// Widgets
import "../container/container_child.dart";
import "../private/min.dart";

/// Class to store the two styling parameters of the [AutoSizeText].
class AutoSizeTextStyle {
  /// Constructor
  const AutoSizeTextStyle({this.maxLines = 1, this.group});

  /// maxLines parameter of [AutoSizeText].
  final int maxLines;

  /// group parameter of [AutoSizeText].
  final AutoSizeGroup? group;
}

/// Class to store two styling parameters of an [Icon].
class IconStyle {
  /// Constructor
  const IconStyle({this.size = 24, this.color});

  /// Size of the [Icon].
  final int size;

  /// Color of the [Icon].
  final Color? color;
}

/// The custom themed button used across the app.
class SpaceJamButton extends StatelessWidget {
  /// Constructor
  const SpaceJamButton({
    required this.valueFontSize,
    required this.titleFontSize,
    this.background = Colors.white12,
    this.valueTextStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    this.titleTextStyle =
        const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
    this.tooltip = "",
    this.title,
    this.iconStyle = const IconStyle(),
    this.autoSizeTextStyle = const AutoSizeTextStyle(),
    this.action,
    this.valueSizeGroup,
    this.value,
    Key? key,
  }) : super(key: key);

  /// Background color of the image.
  final Color background;

  /// Title of the button.
  final String? title;

  /// Styling of the text.
  final TextStyle titleTextStyle;

  /// It's usually `MediaQuery.of(context).size.width * .05`
  final double titleFontSize;

  /// The value of the button. [String] or a [Widget].
  final dynamic value;

  /// If [value] is a String, this will be used to style it.
  final TextStyle valueTextStyle;

  /// [valueFontSize] is usually `MediaQuery.of(context).size.width * .08`
  final double valueFontSize;

  /// The styling of the [Icon].
  final IconStyle iconStyle;

  /// Styling of the value's [AutoSizeText] parts.
  final AutoSizeTextStyle autoSizeTextStyle;

  /// Grouping more buttons together.
  /// This will size the texts equally.
  final AutoSizeGroup? valueSizeGroup;

  /// Tooltip when tapping the [Icon].
  final String tooltip;

  /// Action when tapping on the button.
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    final TextStyle primaryFinalTextStyle =
        valueTextStyle.copyWith(fontSize: valueFontSize);
    final TextStyle secondaryFinalTextStyle =
        titleTextStyle.copyWith(fontSize: titleFontSize);

    return GestureDetector(
      onTap: action,
      child: Padding(padding: EdgeInsets.only(
        bottom: (MediaQuery.of(context).size.width +
        MediaQuery.of(context).size.height) /
    2 *
    (SpaceJamContainerChild.of(context) ? .0 : .04),),
    child: Container(
        width: SpaceJamContainerChild.of(context)
            ? null
            : MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              (MediaQuery.of(context).size.width +
                      MediaQuery.of(context).size.height) /
                  2 *
                  (SpaceJamContainerChild.of(context) ? .02 : .04),
            ),
          ),
          color: background,
        ),
        child: Padding(
          padding: EdgeInsets.all(
            (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                2 *
                (SpaceJamContainerChild.of(context) ? .02 : .03),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // conditional to render text with title or not
              title != null
                  ? Text(
                      title!,
                      style: secondaryFinalTextStyle,
                    )
                  : const Min(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  value is String
                      ? AutoSizeText(
                          value,
                          style: primaryFinalTextStyle,
                          maxLines: autoSizeTextStyle.maxLines,
                          group: autoSizeTextStyle.group,
                        )
                      : value,

                  // conditional to render icon or not
                  action != null
                      ? Tooltip(
                          message: tooltip,
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: MediaQuery.of(context).size.width * .075,
                            color: iconStyle.color ?? valueTextStyle.color,
                          ),
                        )
                      : const Min(),
                ],
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
