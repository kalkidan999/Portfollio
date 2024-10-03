import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app.dart';

class ProjectView extends StatelessWidget {
  const ProjectView(
      {super.key,
      required this.constraints,
      required this.enteredMouseRegion,
      required this.playStoreHovered,
      required this.appStoreHovered,
      required this.hoveredIndex,
      required this.onAppStoreHover,
      required this.onPlayStoreHover});
  final BoxConstraints constraints;
  final bool enteredMouseRegion;
  final bool playStoreHovered;
  final bool appStoreHovered;
  final int hoveredIndex;
  final Function(bool isHovered, int index) onPlayStoreHover;
  final Function(bool isHovered, int index) onAppStoreHover;

  @override
  Widget build(BuildContext context) {
    double screenWidth = constraints.maxWidth;
    bool isMobile = screenWidth < 600;

    final deviceSize = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(deviceSize.width * 0.03),
        child: Column(
          children: [
            Text("Projects",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w400, color: blackColor80)),
            sizedHeight(deviceSize.height * 0.02),

            Column(
              children:
                  List.generate(ProjectsData.projectsData.length, (index) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius)),
                    margin: const EdgeInsets.all(defaultPadding),
                    child: Row(children: [
                      if (!(isMobile))
                        Container(
                            height: deviceSize.height * 0.35,
                            width: deviceSize.width * 0.3,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ProjectsData
                                        .projectsData[index].projectImage),
                                    fit: BoxFit.cover))),
                      sizedWidth(deviceSize.width * 0.06),
                      Column(
                        children: [
                          Text(ProjectsData.projectsData[index].projectName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: blackColor80)),
                          sizedHeight(deviceSize.height * 0.02),
                          SizedBox(
                            width: deviceSize.width * 0.5,
                            child: Text(
                              ProjectsData
                                  .projectsData[index].projectDescription,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: blackColor80),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          sizedHeight(deviceSize.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MouseRegion(
                                onEnter: (event) =>
                                    onPlayStoreHover(true, index),
                                onExit: (event) =>
                                    onPlayStoreHover(false, index),
                                child: InkWell(
                                  onTap: () {
                                    final Uri toLaunch = Uri.parse(ProjectsData
                                        .projectsData[index].androidLink);
                                    _launchInBrowser(toLaunch);
                                  },
                                  child: Column(children: [
                                    sizedHeight(5),
                                    SvgPicture.asset(ImagesAsset.playstore,
                                        height: 20, fit: BoxFit.cover),
                                    sizedHeight(5),
                                    Text("PlayStore",
                                        style: TextStyle(
                                            color: playStoreHovered &&
                                                    hoveredIndex == index
                                                ? Colors.cyan
                                                : blackColor))
                                  ]),
                                ),
                              ),
                              sizedWidth(deviceSize.width * 0.02),
                              MouseRegion(
                                  onEnter: (event) =>
                                      onAppStoreHover(true, index),
                                  onExit: (event) =>
                                      onAppStoreHover(false, index),
                                  child: InkWell(
                                    onTap: () {
                                      final Uri toLaunch = Uri.parse(
                                          ProjectsData
                                              .projectsData[index].iosLink);
                                      _launchInBrowser(toLaunch);
                                    },
                                    child: Column(children: [
                                      sizedHeight(5),
                                      SvgPicture.asset(ImagesAsset.appstore,
                                          height: 20, fit: BoxFit.cover),
                                      sizedHeight(5),
                                      Text("AppStore",
                                          style: TextStyle(
                                              color: appStoreHovered &&
                                                      hoveredIndex == index
                                                  ? Colors.cyan
                                                  : blackColor))
                                    ]),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ]));
              }),
            ),

            //   ],
            // ),
          ],
        ));
  }

  Future<void> _launchInBrowser(Uri url) async {
    print(url);
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
      webOnlyWindowName: '_self',
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
