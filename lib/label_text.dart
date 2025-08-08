
import 'package:flutter/material.dart';

abstract class LabelText extends StatelessWidget {
  const LabelText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  TextStyle? getTextStyle(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = DefaultTextStyle.of(context).style;
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: getTextStyle(context)?.copyWith(
        color: color ?? defaultStyle.color,
      ),
    );
  }
}

class LabelLarge extends LabelText {
  const LabelLarge(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge;
}

class LabelMedium extends LabelText {
  const LabelMedium(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium;
}

class LabelSmall extends LabelText {
  const LabelSmall(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
    super.overflow,
    super.maxLines,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) =>
      Theme.of(context).textTheme.labelSmall;
}
