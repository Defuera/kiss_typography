import 'package:flutter/material.dart';

abstract class HeadlineText extends StatelessWidget {
  const HeadlineText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;

  TextStyle? getTextStyle(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context).style;
    return Text(
      text,
      textAlign: textAlign,
      style: getTextStyle(context)?.copyWith(
        color: color ?? defaultStyle.color,
      ),
    );
  }
}

class HeadlineSmall extends HeadlineText {
  const HeadlineSmall(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall;
}

class HeadlineMedium extends HeadlineText {
  const HeadlineMedium(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium;
}

class HeadlineLarge extends HeadlineText {
  const HeadlineLarge(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge;
}
