import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class AppbarSection extends StatelessWidget {
  const AppbarSection(
      {super.key,
      required this.appBarOnHoverd,
      required this.onHoverAppBar,
      required this.appBarHoveredIndex,
      required this.scrolltoSectionpress});

  final bool appBarOnHoverd;
  final Function(bool isHovered, int index) onHoverAppBar;
  final int appBarHoveredIndex;
  final Function(bool willpop, int index) scrolltoSectionpress;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
      height: deviceSize.height * 0.1,
      width: deviceSize.width * 0.99,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          sizedWidth(deviceSize.width * 0.05),
          InkWell(
            onTap: () {
              scrolltoSectionpress(false, 0);
            },
            child: Text("Portfolio",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: whiteColor,
                    fontFamily: "AquateScript")),
          ),
          const Spacer(),
          Row(
              children: List.generate(navbarList.length, (index) {
            return MouseRegion(
              onHover: (event) => onHoverAppBar(true, index),
              onExit: (event) => onHoverAppBar(false, index),
              child: InkWell(
                onTap: () {
                  scrolltoSectionpress(false, index);
                },
                child: Container(
                    margin: EdgeInsets.only(
                        top: 10, right: deviceSize.width * 0.05),
                    child: Text(navbarList[index],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                            color: appBarOnHoverd && appBarHoveredIndex == index
                                ? Colors.cyan
                                : whiteColor))),
              ),
            );
          })),
        ],
      ),
    );
  }
}
