import 'package:flutter/material.dart';

import '../../app.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.all(deviceSize.width * 0.03),
        child: Column(
          children: [
            Text("Skills",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w400, color: blackColor80)),
            sizedHeight(deviceSize.height * 0.02),

            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(SkillsData.skills.length, (index) {
                return Container(
                    margin: const EdgeInsets.all(defaultPadding / 2),
                    child: Container(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      color: whileColor80.withOpacity(0.5),
                      child: Text(SkillsData.skills[index].name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: blackColor80,
                                  fontWeight: FontWeight.w600)),
                    ));
              }),
            ),

            //   ],
            // ),
          ],
        ));
  }
}
