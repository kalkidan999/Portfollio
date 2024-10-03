// import 'package:flutter/material.dart';
// import 'package:portofollio/utils/constants.dart';
// import 'package:portofollio/widgets/responsive_widget.dart';

// class IntroView extends StatelessWidget {
//   const IntroView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.topLeft,
//       height: deviceSize(context).height * 0.99,
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         sizedHeight(deviceSize(context).height * 0.15),
//         Text("Hi, I am Kalkidan Demes",
//             textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
//             style: Theme.of(context)
//                 .textTheme
//                 .displayLarge
//                 ?.copyWith(fontFamily: "Poppins", fontWeight: FontWeight.w500)),
//         sizedHeight(10),
//         Text("Software Developer",
//             textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
//             style: Theme.of(context)
//                 .textTheme
//                 .titleLarge
//                 ?.copyWith(fontFamily: "Poppins")),
//       ]),
//     );
//   }
// }
