import 'package:flutter/material.dart';

class TypographyData {
  final double? headlineLarge;
  final double? headlineMedium;
  final double? headlineSmall;
  final double? titleLarge;
  final double? titleMedium;
  final double? titleSmall;
  final double? bodyLarge;
  final double? bodyMedium;
  final double? bodySmall;
  final double? labelLarge;
  final double? labelMedium;
  final double? labelSmall;

  const TypographyData({
    this.headlineLarge,
    this.headlineMedium,
    this.headlineSmall,
    this.titleLarge,
    this.titleMedium,
    this.titleSmall,
    this.bodyLarge,
    this.bodyMedium,
    this.bodySmall,
    this.labelLarge,
    this.labelMedium,
    this.labelSmall,
  });
}

class TypographyBreakpoints {
  final double medium;
  final double large;

  const TypographyBreakpoints({
    this.medium = 600,
    this.large = 1024,
  });
}

class ResponsiveTypography extends StatelessWidget {
  final TypographyBreakpoints breakpoints;
  final TypographyData small;
  final TypographyData medium;
  final TypographyData large;
  final Widget child;

  const ResponsiveTypography({
    super.key,
    this.breakpoints = const TypographyBreakpoints(),
    required this.small,
    required this.medium,
    required this.large,
    required this.child,
  });

  static TypographyData? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_TypographyDataScope>()
        ?.data;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final data = width >= breakpoints.large
        ? large
        : width >= breakpoints.medium
            ? medium
            : small;
    return _TypographyDataScope(data: data, child: child);
  }
}

class _TypographyDataScope extends InheritedWidget {
  final TypographyData data;

  const _TypographyDataScope({
    required this.data,
    required super.child,
  });

  @override
  bool updateShouldNotify(_TypographyDataScope oldWidget) =>
      data != oldWidget.data;
}
