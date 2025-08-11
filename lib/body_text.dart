import 'package:flutter/material.dart';

abstract class BodyText extends StatelessWidget {
  const BodyText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  TextStyle? getTextStyle(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context).style;
    final themeStyle = getTextStyle(context);
    final effectiveStyle =
        themeStyle == null ? defaultStyle : defaultStyle.merge(themeStyle);

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: color != null
          ? effectiveStyle.copyWith(color: color)
          : effectiveStyle,
    );
  }
}

class BodySmall extends BodyText {
  const BodySmall(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.maxLines,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;
}

class BodyMedium extends BodyText {
  const BodyMedium(
    super.text, {
    super.key,
    super.color,
    super.maxLines,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;
}

class BodyLarge extends BodyText {
  const BodyLarge(
    super.text, {
    super.key,
    super.maxLines,
    super.color,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge;
}
