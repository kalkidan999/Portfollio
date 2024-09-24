import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portofollio/screens/homepage/views/intro_view.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app.dart';

enum NavItems { About, Experience, Projects, Contact }

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late ScrollToId scrollToId;
  final ScrollController scrollController = ScrollController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  int selectedIndex = 0;
  int appBarHoveredIndex = 0;
  bool _onHoverd = false;
  bool _onappBarHoverd = false;
  NavItems? navItems;

  void _scrollListener() {
    print(scrollToId.idPosition());
  }

  @override
  void initState() {
    super.initState();

    /// Create ScrollToId instance
    scrollToId = ScrollToId(scrollController: scrollController);

    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    TextStyle? actionTextStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(fontWeight: FontWeight.w500, letterSpacing: 1.0);
    return SafeArea(
        child: Scaffold(
      appBar: deviceSize.width < 600
          ? AppBar(
              leadingWidth: deviceSize.width * 0.2,
              leading: InkWell(
                onTap: () {
                  scrollToId.animateTo(0.toString(),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                child: Text("Portfolio",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: whiteColor,
                        fontFamily: "AquateScript")),
              ))
          : _buildAppBar(context),
      endDrawer: deviceSize.width < 600
          ? Drawer(
              child: Column(
                  children: List.generate(navbarList.length, (index) {
                return MouseRegion(
                  onHover: (event) => _onHoverAppBar(true, index),
                  onExit: (event) => _onHoverAppBar(false, index),
                  child: InkWell(
                    onTap: () {
                      scrollToId.animateTo('$index',
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                      Navigator.pop(context);
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            top: deviceSize.height * 0.1,
                            right: deviceSize.width * 0.05),
                        child: Text(navbarList[index],
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context)),
                            style: actionTextStyle?.copyWith(
                                color: _onappBarHoverd &&
                                        appBarHoveredIndex == index
                                    ? Colors.cyan
                                    : Colors.white))),
                  ),
                );
              })),
            )
          : null,
      body: deviceSize.width > 600
          ? Row(children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      height: deviceSize.height * 0.6,
                      child: Column(children: [
                        const Spacer(),
                        Expanded(
                          flex: 2,
                          child: NavigationRail(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              onDestinationSelected: (int index) {
                                print("nav selected $index");
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
                                    final Uri toLaunch = Uri.parse(
                                        "https://x.com/KalkidanDemes");
                                    _launchInBrowser(toLaunch);
                                    break;

                                  default:
                                }
                                // setState(() {
                                //   selectedIndex = index;
                                // });
                              },
                              indicatorColor: Theme.of(context)
                                  .scaffoldBackgroundColor
                                  .withOpacity(0.5),
                              destinations: <NavigationRailDestination>[
                                ...List.generate(4, (index) {
                                  return navigationRailDestination(
                                      imageLinks()[index], index);
                                })
                              ],
                              selectedIndex: selectedIndex),
                        ),
                        _buildVerticalDivider(),
                      ]))),
              Expanded(
                child: InteractiveScrollViewer(
                  scrollToId: scrollToId,
                  children: List.generate(navbarList.length, growable: false,
                      (index) {
                    return index == 0
                        ? ScrollContent(id: '$index', child: const IntroView())
                        : index == 1
                            ? ScrollContent(
                                id: '$index', child: const AboutView())
                            : index == 2
                                ? ScrollContent(
                                    id: '$index', child: const ExperienceView())
                                : index == 3
                                    ? ScrollContent(
                                        id: '$index',
                                        child: const ProjetcsView())
                                    : ScrollContent(
                                        id: '$index',
                                        child: ContactView(
                                            namecontroller: _nameController,
                                            emailcontroller: _emailController,
                                            messagecontroller:
                                                _messageController,
                                            onPressed: _sendEmail),
                                      );
                  }),
                ),
              ),
            ])
          : Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: InteractiveScrollViewer(
                scrollToId: scrollToId,
                children: List.generate(navbarList.length, (index) {
                  return index == 0
                      ? ScrollContent(id: '$index', child: const IntroView())
                      : index == 1
                          ? ScrollContent(
                              id: '$index', child: const AboutView())
                          : index == 2
                              ? ScrollContent(
                                  id: '$index', child: const ExperienceView())
                              : index == 3
                                  ? ScrollContent(
                                      id: '$index', child: const ProjetcsView())
                                  : ScrollContent(
                                      id: '$index',
                                      child: ContactView(
                                          namecontroller: _nameController,
                                          emailcontroller: _emailController,
                                          messagecontroller: _messageController,
                                          onPressed: _sendEmail),
                                    );
                }),
              ),
            ),
    ));
  }

  List<String> imageLinks() => [
        "assets/images/github.svg",
        "assets/images/instagram.svg",
        "assets/images/linkedin.svg",
        "assets/images/twitter.svg",
      ];

  NavigationRailDestination navigationRailDestination(
      String imageLink, int index) {
    return NavigationRailDestination(
        icon: MouseRegion(
          onEnter: (event) => _onHover(true, index),
          onExit: (event) => _onHover(false, index),
          child: SvgPicture.asset(imageLink,
              color: _onHoverd && index == selectedIndex
                  ? Colors.cyan
                  : greyColor),
        ),
        label: const SizedBox.shrink());
  }

  Future<void> _launchInBrowser(Uri url) async {
    print(url);
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: '_self',
    )) {
      throw Exception('Could not launch $url');
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'kalkidandemes99@gmail.com',
      query:
          "subject=${_nameController.text.isEmpty ? "Message from Portfolio Website" : "${_nameController.text}: Message from Portfolio Website"}&body=${_messageController.text.isEmpty ? "Hi, I think we need a web or mobile apps to be developed for our products at Company X. Can we discuss about it?\n ${_emailController.text.isNotEmpty ? "Here is my email address ${_emailController.text}" : ""}" : _messageController.text}",
    );

    if (await launchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      // Handle the error
      print('Could not launch email client');
    }
  }

  void _onHover(bool isHovered, int index) {
    setState(() {
      _onHoverd = isHovered;
      selectedIndex = index;
    });
  }

  void _onHoverAppBar(bool isHovered, int index) {
    setState(() {
      _onappBarHoverd = isHovered;
      appBarHoveredIndex = index;
    });
  }

  PreferredSize _buildAppBar(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    TextStyle? actionTextStyle = Theme.of(context)
        .textTheme
        .bodySmall
        ?.copyWith(fontWeight: FontWeight.w500, letterSpacing: 1.0);
    return PreferredSize(
      preferredSize:
          Size(double.maxFinite, MediaQuery.of(context).size.height * 0.12),
      child: AppBar(actions: [
        sizedWidth(deviceSize.width * 0.05),
        InkWell(
          onTap: () {
            scrollToId.animateTo(0.toString(),
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
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
                scrollToId.animateTo('$index',
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              child: Container(
                  margin:
                      EdgeInsets.only(top: 10, right: deviceSize.width * 0.05),
                  child: Text(navbarList[index],
                      style: actionTextStyle?.copyWith(
                          color: _onappBarHoverd && appBarHoveredIndex == index
                              ? Colors.cyan
                              : Colors.white))),
            ),
          );
        })),
      ]),
    );
  }

  Widget _buildVerticalDivider() {
    return const Expanded(
      flex: 1,
      child: SizedBox(width: 2, child: VerticalDivider(color: blackColor40)),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
