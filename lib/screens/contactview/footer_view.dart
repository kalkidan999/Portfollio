import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app.dart';

class FooterView extends StatelessWidget {
  const FooterView(
      {super.key,
      required this.constraints,
      required this.footerHoveredIndex,
      required this.footerOnHoverd,
      required this.onHover});

  final BoxConstraints constraints;
  final int footerHoveredIndex;
  final bool footerOnHoverd;
  final Function(bool isHovered, int index) onHover;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    double screenWidth = constraints.maxWidth;
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    return Padding(
      padding: EdgeInsets.all(deviceSize.width * 0.03),
      child: isMobile || isTablet
          ? Column(
              children: [
                sizedHeight(deviceSize.height * 0.05),
                Text("Copyright © 2024 Kalkidan Demes",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400, color: blackColor80)),
                sizedHeight(deviceSize.height * 0.03),
                socialMedialWidget()
              ],
            )
          : Row(
              children: [
                Text("Copyright © 2024 Kalkidan Demes",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: blackColor80)),
                const Spacer(),
                socialMedialWidget()
              ],
            ),
    );
  }

  Row socialMedialWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(4, (index) {
          return InkWell(
              onTap: () {
                switch (index) {
                  case 0:
                    final Uri toLaunch =
                        Uri.parse("https://github.com/kalkidan999");
                    _launchInBrowser(toLaunch);
                    break;
                  case 1:
                    final Uri toLaunch = Uri.parse(
                        "https://www.instagram.com/kalkidandemes/?igsh=MXB2Y3pqbXNua29saw%3D%3D");
                    _launchInBrowser(toLaunch);
                    break;
                  case 2:
                    final Uri toLaunch = Uri.parse(
                        "https://www.linkedin.com/in/kalkidan-demes-5022361b6/");
                    _launchInBrowser(toLaunch);
                    break;
                  case 3:
                    final Uri toLaunch =
                        Uri.parse("https://x.com/KalkidanDemes");
                    _launchInBrowser(toLaunch);
                    break;

                  default:
                }
              },
              child: socialMedialLinks(ImagesAsset.imageLinks()[index], index));
        })
      ],
    );
  }

  Widget socialMedialLinks(String imageLink, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: MouseRegion(
        onEnter: (event) => onHover(true, index),
        onExit: (event) => onHover(false, index),
        child: SvgPicture.asset(imageLink,
            color: footerOnHoverd && index == footerHoveredIndex
                ? backgroundColor
                : greyColor),
      ),
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
}
