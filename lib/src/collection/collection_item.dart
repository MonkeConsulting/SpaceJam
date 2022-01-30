// Flutter
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";

// widgets
import "../theme/text_styles.dart";
import "../private/min.dart";

/// [CollectionItem] [AutoSizeText] Groups.
/// For big texts, values
final AutoSizeGroup collectionItemValueAutoSizeGroup = AutoSizeGroup();
/// For small texts, captions
final AutoSizeGroup collectionItemCaptionAutoSizeGroup = AutoSizeGroup();

/// Collection item is a widget to represent an individual from a group.
class SpaceJamCollectionItem extends StatelessWidget {
  /// Constructor
  const SpaceJamCollectionItem({
    required this.upperValue,
    Key? key,
    this.upperCaption,
    this.tooltip = "",
    this.onTap,
    this.pathToBackground,
    this.backgroundColor,
    this.lowerCaption,
    this.lowerValue,
  }) : super(key: key);

  /// Upper caption.
  final String? upperCaption;
  /// Upper value.
  final String upperValue;

  /// Lower caption.
  final String? lowerCaption;
  /// Lower value.
  final String? lowerValue;

  /// Path to the background.
  final String? pathToBackground;

  /// Background color.
  final Color? backgroundColor;

  /// Tooltip.
  final String tooltip;

  /// Action triggered on tap.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Tooltip(
        message: tooltip,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                image: pathToBackground != null
                      ? DecorationImage(
                    image: AssetImage(pathToBackground!),
                    fit: BoxFit.cover,
                  )
                      : null,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        2 *
                        .04,
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width * .4,
              height: MediaQuery.of(context).size.height * .2,
              child: Padding(
                padding: EdgeInsets.all(
                  (MediaQuery.of(context).size.width +
                          MediaQuery.of(context).size.height) /
                      2 *
                      .03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        upperCaption != null
                            ? AutoSizeText(
                                upperCaption!,
                                style: SpaceJamTextStyles.bodySmall(
                                  context,
                                  fontWeight: FontWeight.bold,
                                ),
                                group: collectionItemCaptionAutoSizeGroup,
                                maxLines: 1,
                                minFontSize: 1,
                              ) : const Min(),
                        AutoSizeText(
                          upperValue,
                          group: collectionItemValueAutoSizeGroup,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: SpaceJamTextStyles.bodyMedium(
                            context,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 1,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            lowerCaption != null
                                ? AutoSizeText(
                              lowerCaption!,
                              style: SpaceJamTextStyles.bodySmall(
                                context,
                                fontWeight: FontWeight.bold,
                              ),
                              group: collectionItemCaptionAutoSizeGroup,
                              maxLines: 1,
                              minFontSize: 1,
                            ): const Min(),
                            lowerValue != null
                                ? Text(
                              lowerValue!,
                              style: SpaceJamTextStyles.bodyMedium(
                                context,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ): const Min(),
                          ],
                        ),
                        onTap != null ? Icon(
                          Icons.arrow_forward_rounded,
                          size: MediaQuery.of(context).size.width * .075,
                          color: Colors.white,
                        ) : const Min(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      );
}
