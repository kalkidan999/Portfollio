import 'package:flutter/material.dart';

import '../../app.dart';

class Aboutview extends StatelessWidget {
  const Aboutview({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    double screenWidth = constraints.maxWidth;
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    // bool isDesktop = screenWidth >= 1024;
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(deviceSize.width * 0.03),
      child: isMobile || isTablet
          ? Column(
              children: [
                sizedHeight(deviceSize.height * 0.1),
                Text("About Me",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: blackColor80)),
                sizedHeight(deviceSize.height * 0.02),
                Text(
                    "A passionate software engineer with three years of experience in crafting innovative and efficient solutions. My journey in the tech world has been an exciting blend of learning, creativity, and collaboration.I specialize in mobile app development with experience in Flutter, NodeJS , MongoDB and others. I have worked on a variety of projects ranging from e-commmerce, ride-sharing, e-wallets to payment apps.",
                    maxLines: 15,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: blackColor80)),
                sizedHeight(deviceSize.height * 0.1),
              ],
            )
          : Row(
              children: [
                Text("About Me",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: blackColor80)),
                sizedWidth(deviceSize.width * 0.1),
                Flexible(
                  child: Text(
                      "A passionate software engineer with three years of experience in crafting innovative and efficient solutions. My journey in the tech world has been an exciting blend of learning, creativity, and collaboration.I specialize in mobile app development with experience in Flutter, NodeJS , MongoDB and others. I have worked on a variety of projects ranging from e-commmerce, ride-sharing, e-wallets to payment apps.",
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: blackColor80,
                          )),
                ),
                sizedWidth(deviceSize.width * 0.05),
              ],
            ),
    );
  }
}
