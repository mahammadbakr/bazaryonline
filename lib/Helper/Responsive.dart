import 'dart:io';
import 'package:flutter/material.dart';

enum ResponsiveType { lg, md, sm }

class Responsive extends StatelessWidget {
  // final Widget xs;
  final Widget sm;
  final Widget md;
  final Widget lg;

  const Responsive({
    // @required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool xsBreakpoints(BuildContext context) => screenWidth(context) < 600;

  static bool smBreakpoints(BuildContext context) =>
      screenWidth(context) >= 600 && screenWidth(context) < 960;

  static bool mdBreakpoints(BuildContext context) =>
      screenWidth(context) >= 960 && screenWidth(context) < 1280;

  static bool lgBreakpoints(BuildContext context) =>
      screenWidth(context) >= 1280;

  static bool isWindows(BuildContext context) =>
      Platform.isWindows && (lgBreakpoints(context) || mdBreakpoints(context));

  static bool isAndroid() => Platform.isAndroid;

  static bool isIOS() => Platform.isIOS;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1280) {
          return lg;
        } else if (constraints.maxWidth >= 960 && constraints.maxWidth < 1280) {
          return md;
        } else {
          return sm;
        }
      },
    );
  }
}

// Widget singleElementPage(
//     {required BuildContext context, required Widget child}) {
//   return Padding(
//     padding: EdgeInsets.symmetric(
//         horizontal: Responsive.xsBreakpoints(context)
//             ? 0
//             : Responsive.screenWidth(context) / 5),
//     child: child,
//   );
// }
