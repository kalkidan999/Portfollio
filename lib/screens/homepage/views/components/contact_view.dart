import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/responsive_widget.dart';
import 'email_me.dart';

class ContactView extends StatefulWidget {
  const ContactView(
      {super.key,
      required this.namecontroller,
      required this.emailcontroller,
      required this.messagecontroller,
      required this.onPressed});

  final TextEditingController namecontroller;
  final TextEditingController emailcontroller;
  final TextEditingController messagecontroller;
  final VoidCallback onPressed;

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  int selectedIndex = 0;
  bool _onHoverd = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: deviceSize.height * 0.99,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedHeight(deviceSize.height * 0.07),
            Text("Let's get in touch",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: deviceSize.height * 0.07,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: deviceSize.width < 600
                  ? deviceSize.width * 0.7
                  : deviceSize.width * 0.4,
              child: Text(
                  "Got a question or proposal, or just want to say hello? Go head.",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: deviceSize.height * 0.02,
                      )),
            ),
            sizedHeight(deviceSize.height * 0.07),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                  left: deviceSize.width * 0.1, right: deviceSize.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Your Name"),
                          sizedHeight(10),
                          EmailMeView(
                              controller: widget.namecontroller,
                              hintText: "Enter your name"),
                        ],
                      ),
                      sizedWidth(deviceSize.width * 0.2),
                      if (deviceSize.width > 600)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email Address"),
                            sizedHeight(10),
                            EmailMeView(
                                controller: widget.emailcontroller,
                                hintText: "Enter your email address"),
                          ],
                        )
                    ],
                  ),
                  if (deviceSize.width <= 600)
                    sizedHeight(deviceSize.height * 0.02),
                  if (deviceSize.width <= 600)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email Address"),
                        sizedHeight(10),
                        EmailMeView(
                            controller: widget.emailcontroller,
                            hintText: "Enter your email address"),
                      ],
                    ),
                  sizedHeight(deviceSize.height * 0.02),
                  const Text("Your Message"),
                  sizedHeight(10),
                  SizedBox(
                    width: deviceSize.width * 0.7,
                    child: EmailMeView(
                        controller: widget.messagecontroller,
                        hintText:
                            "Hi, I think we need a web or mobile apps to be developed for our products at Company X. Can we discuss about it?"),
                  ),
                  sizedHeight(deviceSize.height * 0.02),
                  SizedBox(
                      width: deviceSize.width > 1000
                          ? deviceSize.width * 0.12
                          : deviceSize.width < 600
                              ? deviceSize.width * 0.3
                              : deviceSize.width * 0.2,
                      child: _emailButton(context)),
                  sizedHeight(deviceSize.height * 0.02),
                  const Divider(endIndent: 30, color: Colors.cyan),
                  sizedHeight(deviceSize.height * 0.02),
                  deviceSize.width < 600
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("You can also contact me with "),
                            sizedHeight(deviceSize.height * 0.02),
                            SizedBox(
                                width: deviceSize.width * 0.3,
                                child: _telegramButton(context)),
                          ],
                        )
                      : Row(
                          children: [
                            const Text("You can also contact me with "),
                            sizedWidth(deviceSize.width * 0.02),
                            SizedBox(
                                width: deviceSize.width * 0.15,
                                child: _telegramButton(context)),
                          ],
                        ),
                ],
              ),
            ),
            sizedHeight(deviceSize.height * 0.02),
            const Divider(endIndent: 10, indent: 20),
            sizedHeight(deviceSize.height * 0.02),
            deviceSize.width > 600
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(4, (index) {
                        return InkWell(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  final Uri toLaunch = Uri.parse(
                                      "https://github.com/kalkidan999");
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
                            child: navigationRailDestination(
                                imageLinks()[index], index));
                      })
                    ],
                  ),
            sizedHeight(deviceSize.height * 0.01),
            const Text("Copyright 2024 © Kalkidan Demes"),
          ],
        ),
      ),
    );
  }

  List<String> imageLinks() => [
        "assets/images/github.svg",
        "assets/images/instagram.svg",
        "assets/images/linkedin.svg",
        "assets/images/twitter.svg",
      ];
  Widget navigationRailDestination(String imageLink, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: MouseRegion(
        onEnter: (event) => _onHover(true, index),
        onExit: (event) => _onHover(false, index),
        child: SvgPicture.asset(imageLink,
            color:
                _onHoverd && index == selectedIndex ? Colors.cyan : greyColor),
      ),
    );
  }

  void _onHover(bool isHovered, int index) {
    setState(() {
      _onHoverd = isHovered;
      selectedIndex = index;
    });
  }

  ElevatedButton _emailButton(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(2),
                side: const BorderSide(color: Colors.grey))),
        onPressed: widget.onPressed,
        icon: const Icon(Icons.mail),
        label: Text(
          "Shoot",
          style: Theme.of(context).textTheme.bodySmall,
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ));
  }

  ElevatedButton _telegramButton(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.grey))),
        onPressed: () {
          final Uri toLaunch = Uri.parse("https://t.me/faminfinity");
          _launchInBrowser(toLaunch);
        },
        icon: SvgPicture.asset("assets/images/telegram.svg", height: 20),
        label: Text("@faminfinity",
            maxLines: 1, style: Theme.of(context).textTheme.bodySmall));
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
