import 'package:flutter/material.dart';
import 'package:kiss_typography/responsive_typography.dart';

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
    final themeStyle = getTextStyle(context);
    final effectiveStyle =
        themeStyle == null ? defaultStyle : defaultStyle.merge(themeStyle);

    return Text(
      text,
      textAlign: textAlign,
      style: color != null
          ? effectiveStyle.copyWith(color: color)
          : effectiveStyle,
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
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.headlineSmall;
    final fontSize = ResponsiveTypography.of(context)?.headlineSmall;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}

class HeadlineMedium extends HeadlineText {
  const HeadlineMedium(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.headlineMedium;
    final fontSize = ResponsiveTypography.of(context)?.headlineMedium;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}

class HeadlineLarge extends HeadlineText {
  const HeadlineLarge(
    super.text, {
    super.key,
    super.color,
    super.textAlign,
  });

  @override
  TextStyle? getTextStyle(BuildContext context) {
    final style = Theme.of(context).textTheme.headlineLarge;
    final fontSize = ResponsiveTypography.of(context)?.headlineLarge;
    return fontSize != null ? style?.copyWith(fontSize: fontSize) : style;
  }
}
