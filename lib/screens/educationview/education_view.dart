import 'package:flutter/material.dart';

import '../../app.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.all(deviceSize.width * 0.03),
        child: Column(
          children: [
            Text("Education",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w400, color: blackColor80)),
            sizedHeight(deviceSize.height * 0.02),

            Column(
              children: List.generate(EducationData.education.length, (index) {
                return Container(
                    margin: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: deviceSize.width * 0.8,
                          padding: const EdgeInsets.all(defaultPadding),
                          color: whiteColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sizedHeight(deviceSize.height * 0.02),
                              Text(
                                  EducationData.education[index].universityName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: blackColor80,
                                          fontWeight: FontWeight.w600)),
                              Text(EducationData.education[index].title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: blackColor80)),
                              sizedHeight(deviceSize.height * 0.02),
                              Text(
                                  EducationData
                                      .education[index].educationDescription,
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(color: blackColor80))
                            ],
                          ),
                        ),
                      ],
                    ));
              }),
            ),

            //   ],
            // ),
          ],
        ));
  }
}
