// import 'package:flutter/material.dart';

// import '../../../../app.dart';
// import '../../../../models/experience.dart';

// class ExperienceView extends StatelessWidget {
//   const ExperienceView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.maxFinite,
//       height: deviceSize(context).height * 0.99,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           sizedHeight(deviceSize(context).height * 0.05),
//           Text("Work Experience",
//               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   fontSize: deviceSize(context).height * 0.07,
//                   fontFamily: "Poppins",
//                   fontWeight: FontWeight.bold)),
//           SizedBox(
//               height: deviceSize(context).height * 0.7,
//               width: double.maxFinite,
//               child: ListView.builder(
//                   itemCount: ExperienceData.myExperiences.length,
//                   itemBuilder: (context, int index) {
//                     return Row(
//                       children: [
//                         Column(
//                           children: [
//                             Image.asset(
//                               ExperienceData.myExperiences[index].companyLogo,
//                               height: deviceSize(context).height * 0.1,
//                             ),
//                             _buildVerticalDivider(context),
//                           ],
//                         ),
//                         sizedWidth(deviceSize(context).width * 0.02),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             sizedHeight(deviceSize(context).height * 0.02),
//                             Text(
//                                 ExperienceData.myExperiences[index].companyName,
//                                 textScaler: TextScaler.linear(
//                                     ScaleSize.textScaleFactor(context)),
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headlineSmall
//                                     ?.copyWith(fontWeight: FontWeight.bold)),
//                             Text(
//                                 ExperienceData
//                                     .myExperiences[index].employmentDate,
//                                 textScaler: TextScaler.linear(
//                                     ScaleSize.textScaleFactor(context)),
//                                 style: Theme.of(context).textTheme.bodyLarge),
//                             sizedHeight(deviceSize(context).height * 0.02),
//                             Column(
//                                 children: List.generate(
//                                     ExperienceData.myExperiences[index]
//                                         .jobDescription.length, (idx) {
//                               return BulletList(
//                                 ExperienceData
//                                     .myExperiences[index].jobDescription[idx],
//                                 width: deviceSize(context).width * 0.7,
//                               );
//                             }))
//                           ],
//                         )
//                       ],
//                     );
//                   }))
//         ],
//       ),
//     );
//   }

//   Widget _buildVerticalDivider(BuildContext context) {
//     return SizedBox(
//         width: 2,
//         height: deviceSize(context).height * 0.15,
//         child: const VerticalDivider(color: blackColor40));
//   }
// }
