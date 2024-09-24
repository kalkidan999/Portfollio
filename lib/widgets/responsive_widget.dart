// // ignore: prefer_generic_function_type_aliases
import 'dart:math';

import 'package:flutter/material.dart';

// typedef OnSmallScreen = void Function();
// // ignore: prefer_generic_function_type_aliases
// typedef void OnLargeScreen();
// // ignore: prefer_generic_function_type_aliases
// typedef void OnMediumScreen();

// class ResponsiveWidget extends StatelessWidget {
//   final Widget largeScreen;

//   final Widget smallScreen;
//   // final OnSmallScreen onSmallScreen;
//   // final OnMediumScreen onMediumScreen;
//   // final OnLargeScreen onLargeScreen;

//   const ResponsiveWidget({
//     super.key,
//     required this.largeScreen,
//     required this.smallScreen,
//     // required this.onSmallScreen,
//     // required this.onMediumScreen,
//     // required this.onLargeScreen,
//   });

// //  static bool isSmallScreen(BuildContext context) {
// //    return MediaQuery.of(context).size.width < 800;
// //  }
// //
// //  static bool isLargeScreen(BuildContext context) {
// //    return MediaQuery.of(context).size.width > 800;
// //  }
// //
// //  static bool isMediumScreen(BuildContext context) {
// //    return MediaQuery.of(context).size.width >= 800 &&
// //        MediaQuery.of(context).size.width <= 1200;
// //  }
// //
// //  @override
// //  Widget build(BuildContext context) {
// //    return LayoutBuilder(
// //      builder: (context, constraints) {
// //        if (constraints.maxWidth > 1200) {
// //          return largeScreen;
// //        } else if (constraints.maxWidth <= 1200 && constraints.maxWidth >= 800) {
// //          return mediumScreen ?? largeScreen;
// //        } else {
// //          return smallScreen ?? largeScreen;
// //        }
// //      },
// //    );
// //  }
//   static bool isSmallScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width < 428;
//   }

//   static bool isLargeScreen(BuildContext context) {
//     return MediaQuery.of(context).size.width > 1125;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth > 800) {
//           //onLargeScreen();
//           return largeScreen;
//         } else {
//           print('small screen ${constraints.maxWidth}');
//           return smallScreen;
//         }
//       },
//     );
//   }
// }

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
