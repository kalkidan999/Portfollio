import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({
    super.key,
    required this.constraints,
  });
  final BoxConstraints constraints;

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  bool enteredMouseRegion = false;
  bool playStoreHovered = false;
  bool appStoreHovered = false;
  int hoveredIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = widget.constraints.maxWidth;
    bool isMobile = screenWidth < 600;

    final deviceSize = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(deviceSize.width * 0.03),
        child: Column(
          children: [
            Text("Projects",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: blackColor80)),
            sizedHeight(deviceSize.height * 0.02),
            Column(
                children:
                    List.generate(ProjectsData.projectsData.length, (index) {
              return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      borderRadius: BorderRadius.circular(defaultBorderRadius)),
                  margin: const EdgeInsets.all(defaultPadding),
                  child: !isMobile
                      ? Row(children: [
                          Container(
                              height: deviceSize.height * 0.35,
                              width: deviceSize.width * 0.3,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(ProjectsData
                                          .projectsData[index].projectImage),
                                      fit: BoxFit.cover))),
                          sizedWidth(deviceSize.width * 0.06),
                          projectDetails(context, index)
                        ])
                      : projectDetails(context, index));
            }))
          ],
        ));
  }

  Column projectDetails(BuildContext context, int index) {
    double screenWidth = widget.constraints.maxWidth;
    bool isMobile = screenWidth < 600;

    final deviceSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if ((isMobile)) sizedHeight(deviceSize.height * 0.02),
        Text(ProjectsData.projectsData[index].projectName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: blackColor80)),
        sizedHeight(deviceSize.height * 0.02),
        SizedBox(
          width: isMobile ? double.infinity : deviceSize.width * 0.5,
          child: Text(
            ProjectsData.projectsData[index].projectDescription,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: blackColor80),
            textAlign: TextAlign.center,
          ),
        ),
        sizedHeight(deviceSize.height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              onEnter: (event) => _onPlayStoreHover(true, index),
              onExit: (event) => _onPlayStoreHover(false, index),
              child: InkWell(
                onTap: () {
                  final Uri toLaunch =
                      Uri.parse(ProjectsData.projectsData[index].androidLink);
                  _launchInBrowser(toLaunch);
                },
                child: Column(children: [
                  sizedHeight(5),
                  SvgPicture.asset(ImagesAsset.playstore,
                      height: 20, fit: BoxFit.cover),
                  sizedHeight(5),
                  Text("PlayStore",
                      style: TextStyle(
                          color: playStoreHovered && hoveredIndex == index
                              ? backgroundColor
                              : blackColor))
                ]),
              ),
            ),
            sizedWidth(deviceSize.width * 0.02),
            MouseRegion(
                onEnter: (event) => _onAppStoreHover(true, index),
                onExit: (event) => _onAppStoreHover(false, index),
                child: InkWell(
                  onTap: () {
                    final Uri toLaunch =
                        Uri.parse(ProjectsData.projectsData[index].iosLink);
                    _launchInBrowser(toLaunch);
                  },
                  child: Column(children: [
                    sizedHeight(5),
                    SvgPicture.asset(ImagesAsset.appstore,
                        height: 20, fit: BoxFit.cover),
                    sizedHeight(5),
                    Text("AppStore",
                        style: TextStyle(
                            color: appStoreHovered && hoveredIndex == index
                                ? backgroundColor
                                : blackColor))
                  ]),
                ))
          ],
        ),
        if (isMobile) sizedHeight(deviceSize.height * 0.02),
      ],
    );
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

  void _onPlayStoreHover(bool isHovered, int index) {
    setState(() {
      playStoreHovered = isHovered;
      hoveredIndex = hoveredIndex == index ? 1000 : index;
    });
  }

  void _onAppStoreHover(bool isHovered, int index) {
    setState(() {
      appStoreHovered = isHovered;
      hoveredIndex = hoveredIndex == index ? 1000 : index;
    });
  }
}
