import 'package:flutter/material.dart';

import '../../../app.dart';

class EndDrawerSection extends StatelessWidget {
  const EndDrawerSection(
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
    return Drawer(
      width: deviceSize.width * 0.5,
      backgroundColor: const Color.fromARGB(255, 5, 18, 65),
      child: Column(
          children: List.generate(navbarList.length, (index) {
        return MouseRegion(
          onHover: (event) => onHoverAppBar(true, index),
          onExit: (event) => onHoverAppBar(false, index),
          child: InkWell(
            onTap: () {
              scrolltoSectionpress(true, index);
            },
            child: Container(
                margin: EdgeInsets.only(
                    top: deviceSize.height * 0.05,
                    right: deviceSize.width * 0.05),
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
    );
  }
}
