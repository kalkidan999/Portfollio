import 'package:flutter/material.dart';

import '../../app.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key, required this.constraints});
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
        child: Column(
          children: [
            Text("Experience",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w400, color: blackColor80)),
            sizedHeight(deviceSize.height * 0.02),

            Column(
              children:
                  List.generate(ExperienceData.myExperiences.length, (index) {
                return Container(
                  margin: const EdgeInsets.all(defaultPadding),
                  child: Row(
                    children: [
                      if (!(isMobile || isTablet))
                        SizedBox(
                          width: deviceSize.width * 0.2,
                          child: Text(
                              ExperienceData
                                  .myExperiences[index].employmentDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: blackColor80)),
                        ),
                      SizedBox(
                        width: deviceSize.width * 0.05,
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Image.asset(
                                ExperienceData.myExperiences[index].companyLogo,
                                height: deviceSize.height * 0.1,
                              ),
                            ),
                            SizedBox(
                                width: 2,
                                height: deviceSize.height * 0.15,
                                child:
                                    const VerticalDivider(color: primaryColor))
                          ],
                        ),
                      ),
                      sizedWidth(deviceSize.width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (isMobile || isTablet)
                            Text(
                                ExperienceData
                                    .myExperiences[index].employmentDate,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: blackColor80)),
                          if (isMobile || isTablet)
                            sizedHeight(deviceSize.height * 0.01),
                          Container(
                            width: (isMobile || isTablet)
                                ? deviceSize.width * 0.8
                                : deviceSize.width * 0.6,
                            padding: const EdgeInsets.all(defaultPadding),
                            color: whiteColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                sizedHeight(deviceSize.height * 0.02),
                                Text(
                                    ExperienceData
                                        .myExperiences[index].companyName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(color: blackColor80)),
                                Text(
                                    ExperienceData
                                        .myExperiences[index].positiontitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(color: blackColor80)),
                                sizedHeight(deviceSize.height * 0.02),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                        ExperienceData.myExperiences[index]
                                            .jobDescription.length, (idx) {
                                      return Text(
                                          ExperienceData.myExperiences[index]
                                              .jobDescription[idx],
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(color: blackColor80));
                                    }))
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),

            //   ],
            // ),
          ],
        ));
  }
}
