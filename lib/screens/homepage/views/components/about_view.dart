// import 'package:flutter/material.dart';

// import '../../../../app.dart';

// class AboutView extends StatelessWidget {
//   const AboutView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return SizedBox(
//       width: double.infinity,
//       height: deviceSize.height * 0.99,
//       child: aboutDetails(context),
//     );
//   }

//   Widget aboutDetails(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Introduction",
//                         textScaler: TextScaler.linear(
//                             ScaleSize.textScaleFactor(context)),
//                         style: Theme.of(context).textTheme.headlineSmall),
//                     Text("Overview",
//                         textScaler: TextScaler.linear(
//                             ScaleSize.textScaleFactor(context)),
//                         style: Theme.of(context)
//                             .textTheme
//                             .displayLarge
//                             ?.copyWith(
//                                 fontFamily: "Poppins",
//                                 fontWeight: FontWeight.bold)),
//                     Flexible(
//                       child: Text(
//                           "Hello! My name is Kalkidan Demes, a passionate software engineer with three years of experience in crafting innovative and efficient solutions. My journey in the tech world has been an exciting blend of learning, creativity, and collaboration.I specialize in mobile app development with experience in Flutter, NodeJS , MongoDB and others. I have worked on a variety of projects ranging from e-commmerce, ride-sharing, e-wallets to payment apps.",
//                           maxLines: deviceSize.width > 1200
//                               ? 3
//                               : deviceSize.width > 1000
//                                   ? 5
//                                   : 8,
//                           overflow: TextOverflow.ellipsis,
//                           textScaler: TextScaler.linear(
//                               ScaleSize.textScaleFactor(context)),
//                           style: Theme.of(context).textTheme.bodyMedium),
//                     ),
//                   ],
//                 ),
//               ),
//               if (deviceSize.width > 600) sizedWidth(deviceSize.width * 0.02),
//               if (deviceSize.width > 600)
//                 Expanded(child: imageSection(context)),
//               if (deviceSize.width > 600) sizedWidth(deviceSize.width * 0.02)
//               //   sizedWidth(20),
//             ],
//           ),
//         ),
//         sizedHeight(deviceSize.height * 0.03),
//         Text(
//             "Technologies/Frameworks/State Managements I have been working with recently:",
//             textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
//             style: Theme.of(context).textTheme.bodyMedium),
//         sizedHeight(deviceSize.height * 0.02),
//         Row(
//           children: [
//             const Column(
//               children: [
//                 BulletList('Dart/Flutter'),
//                 BulletList('NodeJS'),
//                 BulletList('NextJS'),
//                 BulletList('Git & GitHub'),
//                 BulletList('PlayStore & AppStore'),
//                 BulletList("TestFlight"),
//                 BulletList("Google APIs"),
//               ],
//             ),
//             sizedWidth(deviceSize.width * 0.1),
//             const Column(
//               children: [
//                 BulletList('Firebase'),
//                 BulletList('RestAPI'),
//                 BulletList('XCode & Android Studio'),
//                 BulletList("Provider"),
//                 BulletList("Bloc"),
//                 BulletList("GetX"),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Container imageSection(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Container(
//       margin: EdgeInsets.only(top: deviceSize.height * 0.03),
//       height: deviceSize.height * 0.5,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//               color: Color.fromARGB(255, 7, 217, 245), offset: Offset(1, 1))
//         ],
//         borderRadius: BorderRadius.circular(defaultBorderRadius),
//         image: const DecorationImage(
//             image: AssetImage("assets/images/kalkidan.jpeg"),
//             fit: BoxFit.cover),
//       ),
//     );
//   }
// }
