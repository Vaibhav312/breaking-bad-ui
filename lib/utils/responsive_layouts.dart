import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout(
      {Key? key,
      required this.tablet,
      required this.phone,
      required this.desktop})
      : super(key: key);

  static int mobileLimit = 576;
  static int tabletLimit = 768;
  static int desktopLimit = 992;

  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.width < tabletLimit;
  }

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletLimit &&
      MediaQuery.of(context).size.width >= mobileLimit;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletLimit;

  static double pageHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double pageWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth < mobileLimit) {
        return phone;
      }
      if (constraints.maxWidth < tabletLimit) {
        return tablet;
      } else {
        return desktop;
      }
    });
  }
}
