import 'package:flutter/cupertino.dart';

class Platform extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  Platform({required this.desktop, required this.mobile, required this.tablet});

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static bool isMobile(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return (width >= 300 && width <= 600);
  }

  static bool isTablet(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return (width >= 601 && width <= 1200);
  }

  static bool isDesktop(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return (width >= 1201);
  }

  @override
  Widget build(BuildContext context) {
    return (isDesktop(context))
        ? desktop
        : (isMobile(context))
            ? mobile
            : tablet;
  }
}
