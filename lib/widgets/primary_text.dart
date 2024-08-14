import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final bool whiteOnLightTheme;
  final bool customBlueColor;
  final bool selectable;
  final double fontSize;
  final double letterSpacing;
  final int maxLines;
  final int minLines;
  final TextOverflow overflow;
  final Color color;
  final TextAlign textAlign;
  final TextDecoration decoration;

  const PrimaryText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14,
    this.letterSpacing = 1,
    this.whiteOnLightTheme = false,
    this.customBlueColor = false,
    this.selectable = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.overflow = TextOverflow.ellipsis,
    required this.color,
    this.textAlign = TextAlign.justify,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return selectable
        ? SelectableText(
            text,
            maxLines: maxLines,
            textAlign: textAlign,
            showCursor: true,
            style: TextStyle(
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              fontSize: fontSize,
              color: whiteOnLightTheme ? Colors.white : color,
              decoration: decoration,
              decorationColor: color,
            ),
          )
        : Text(
            text,
            maxLines: maxLines,
            textAlign: textAlign,
            overflow: overflow,
            style: TextStyle(
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              fontSize: fontSize,
              color: whiteOnLightTheme ? Colors.white : color,
              decoration: decoration,
              decorationColor: color,
            ),
          );
  }
}
