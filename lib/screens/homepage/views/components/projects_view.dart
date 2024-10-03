// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:portofollio/app.dart';
// import 'package:portofollio/models/projects.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../../../../utils/constants.dart';

// class ProjetcsView extends StatefulWidget {
//   const ProjetcsView({
//     super.key,
//   });

//   @override
//   State<ProjetcsView> createState() => _ProjetcsViewState();
// }

// class _ProjetcsViewState extends State<ProjetcsView> {
//   bool enteredMouseRegion = false;
//   bool _playStoreHovered = false;
//   bool _appStoreHovered = false;
//   int hoveredIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return SizedBox(
//         width: double.maxFinite,
//         height: deviceSize.height * 0.99,
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           sizedHeight(deviceSize.height * 0.05),
//           Text("Projects",
//               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   fontSize: deviceSize.height * 0.07,
//                   fontFamily: "Poppins",
//                   fontWeight: FontWeight.bold)),
//           sizedHeight(10),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: deviceSize.width * 0.25,
//                 child: Divider(
//                     thickness: 0.5,
//                     endIndent: deviceSize.width * 0.02,
//                     color: Colors.white),
//               ),
//               Text("Some of my latest works",
//                   textAlign: TextAlign.center,
//                   style: Theme.of(context).textTheme.bodyLarge),
//               SizedBox(
//                 width: deviceSize.width * 0.25,
//                 child: Divider(
//                     indent: deviceSize.width * 0.02, color: Colors.grey),
//               ),
//             ],
//           ),
//           sizedHeight(20),
//           deviceSize.width > 600
//               ? SizedBox(
//                   height: deviceSize.height * 0.5,
//                   width: double.maxFinite,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: ProjectsData.projectsData.length,
//                       itemBuilder: (context, int index) {
//                         return _projectsSection(index);
//                       }),
//                 )
//               : SizedBox(
//                   height: deviceSize.height * 0.7,
//                   width: double.maxFinite,
//                   child: ListView.builder(
//                       scrollDirection: Axis.vertical,
//                       itemCount: ProjectsData.projectsData.length,
//                       itemBuilder: (context, int index) {
//                         return _projectsSection(index);
//                       }),
//                 )
//         ]));
//   }

//   Widget _projectsSection(int index) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Padding(
//       padding: EdgeInsets.all(deviceSize.width * 0.03),
//       child: OutlinedButton(
//         onPressed: () {},
//         style: OutlinedButton.styleFrom(
//             minimumSize: Size(deviceSize.width * 0.3, deviceSize.height * 0.4),
//             maximumSize: Size(deviceSize.width * 0.3, deviceSize.height * 0.4),
//             side: BorderSide(color: Colors.cyan.withOpacity(0.2)),
//             padding: const EdgeInsets.all(8)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             MouseRegion(
//               onEnter: (event) => _onHover(true, index),
//               onExit: (event) => _onHover(false, index),
//               child: enteredMouseRegion && hoveredIndex == index
//                   ? hoveredWidget(
//                       projectsData: ProjectsData.projectsData[index])
//                   : unHoveredWidget(
//                       projectsData: ProjectsData.projectsData[index]),
//             ),
//             const Divider(),
//             Row(
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(ProjectsData.projectsData[index].projectTitle,
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyLarge!
//                             .copyWith(fontWeight: FontWeight.bold)),
//                     Text(ProjectsData.projectsData[index].projectName,
//                         style: Theme.of(context).textTheme.bodyMedium!),
//                   ],
//                 ),
//                 const Spacer(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     MouseRegion(
//                       onEnter: (event) => _onPlayStoreHover(true, index),
//                       onExit: (event) => _onPlayStoreHover(false, index),
//                       child: InkWell(
//                         onTap: () {
//                           final Uri toLaunch = Uri.parse(
//                               ProjectsData.projectsData[index].androidLink);
//                           _launchInBrowser(toLaunch);
//                         },
//                         child: Column(children: [
//                           sizedHeight(5),
//                           SvgPicture.asset("assets/images/playstore.svg",
//                               height: 20, fit: BoxFit.cover),
//                           sizedHeight(5),
//                           Text("PlayStore",
//                               style: TextStyle(
//                                   color:
//                                       _playStoreHovered && hoveredIndex == index
//                                           ? Colors.cyan
//                                           : Colors.white))
//                         ]),
//                       ),
//                     ),
//                     sizedWidth(10),
//                     MouseRegion(
//                       onEnter: (event) => _onAppStoreHover(true, index),
//                       onExit: (event) => _onAppStoreHover(false, index),
//                       child: InkWell(
//                         onTap: () {
//                           final Uri toLaunch = Uri.parse(
//                               ProjectsData.projectsData[index].iosLink);
//                           _launchInBrowser(toLaunch);
//                         },
//                         child: Column(children: [
//                           sizedHeight(5),
//                           SvgPicture.asset("assets/images/appstore.svg",
//                               height: 20, fit: BoxFit.cover),
//                           sizedHeight(5),
//                           Text("AppStore",
//                               style: TextStyle(
//                                   color:
//                                       _appStoreHovered && hoveredIndex == index
//                                           ? Colors.cyan
//                                           : Colors.white))
//                         ]),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _launchInBrowser(Uri url) async {
//     print(url);
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.inAppBrowserView,
//       webOnlyWindowName: '_self',
//     )) {
//       throw Exception('Could not launch $url');
//     }
//   }

//   void _onPlayStoreHover(bool isHovered, int index) {
//     setState(() {
//       _playStoreHovered = isHovered;
//       hoveredIndex = hoveredIndex == index ? 1000 : index;
//     });
//   }

//   void _onAppStoreHover(bool isHovered, int index) {
//     setState(() {
//       _appStoreHovered = isHovered;
//       hoveredIndex = hoveredIndex == index ? 1000 : index;
//     });
//   }

//   void _onHover(bool isHovered, int index) {
//     print("Hoverd $isHovered");
//     setState(() {
//       enteredMouseRegion = isHovered;
//       hoveredIndex = hoveredIndex == index ? 1000 : index;
//     });
//     print("Hoverd $enteredMouseRegion");
//   }

//   Widget unHoveredWidget({required ProjectsData projectsData}) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Container(
//       height: deviceSize.height * 0.25,
//       decoration: BoxDecoration(
//           // color: Colors.red,
//           borderRadius: BorderRadius.circular(defaultBorderRadius),
//           image: DecorationImage(
//               image: AssetImage(projectsData.projectImage), fit: BoxFit.cover)),
//     );
//   }

//   Widget hoveredWidget({required ProjectsData projectsData}) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       height: deviceSize.height * 0.25,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(defaultBorderRadius)),
//       child: Center(
//           child: Text(projectsData.projectDescription,
//               style: Theme.of(context).textTheme.bodyLarge,
//               maxLines: 5,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center)),
//     );
//   }
// }
