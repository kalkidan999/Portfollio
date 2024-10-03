import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class AppbarSection extends StatelessWidget {
  const AppbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    TextStyle? actionTextStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(
            fontWeight: FontWeight.w500, letterSpacing: 1.0, color: whiteColor);
    return SizedBox(
      height: deviceSize.height * 0.1,
      width: deviceSize.width * 0.99,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          sizedWidth(deviceSize.width * 0.05),
          InkWell(
            onTap: () {
              // scrollToId.animateTo(0.toString(),
              //     duration: const Duration(milliseconds: 500),
              //     curve: Curves.ease);
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
              onHover: (event) => _onHoverAppBar(true, index),
              onExit: (event) => _onHoverAppBar(false, index),
              child: InkWell(
                onTap: () {
                  // scrollToId.animateTo('$index',
                  //     duration: const Duration(milliseconds: 500),
                  //     curve: Curves.ease);
                },
                child: Container(
                    margin: EdgeInsets.only(
                        top: 10, right: deviceSize.width * 0.05),
                    child: Text(navbarList[index],
                        style: actionTextStyle?.copyWith(

                            //  _onappBarHoverd && appBarHoveredIndex == index
                            //     ? Colors.cyan
                            //:
                            ))),
              ),
            );
          })),
        ],
      ),
    );
  }

  void _onHover(bool isHovered, int index) {
    // setState(() {
    //   _onHoverd = isHovered;
    //   selectedIndex = index;
    // });
  }

  void _onHoverAppBar(bool isHovered, int index) {
    // setState(() {
    //   _onappBarHoverd = isHovered;
    //   appBarHoveredIndex = index;
    // });
  }
}
