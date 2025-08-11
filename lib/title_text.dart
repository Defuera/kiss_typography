import 'package:flutter/material.dart';

abstract class TitleText extends StatelessWidget {
  const TitleText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
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
      overflow: overflow,
      textAlign: textAlign,
      style: color != null
          ? effectiveStyle.copyWith(color: color)
          : effectiveStyle,
    );
  }
}

class TitleLarge extends TitleText {
  const TitleLarge(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge;
}

class TitleMedium extends TitleText {
  const TitleMedium(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;
}

class TitleSmall extends TitleText {
  const TitleSmall(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;
}
