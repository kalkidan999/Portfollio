import 'package:flutter/material.dart';
import 'package:scroll_to_id/scroll_to_id.dart';
import '../../app.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late ScrollToId scrollToId;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    /// Create ScrollToId instance
    scrollToId = ScrollToId(scrollController: scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: InteractiveScrollViewer(
              scrollToId: scrollToId,
              children: List.generate(navbarList.length, growable: false,
                  (int index) {
                return ScrollContent(
                    id: index.toString(),
                    child: switch (index) {
                      0 => Introview(
                          homeconstraints: constraints,
                          scrolltoSectionpress: (bool willpop, int index) {
                            scrollToId.animateTo(index.toString(),
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            if (willpop) Navigator.pop(context);
                          }),
                      1 => Aboutview(constraints: constraints),
                      2 => const ExperienceView(),
                      3 => EducationView(constraints: constraints),
                      4 => const ProjectView(),
                      5 => SkillsView(constraints: constraints),
                      6 => ContactView(constraints: constraints),
                      int() => Introview(
                          homeconstraints: constraints,
                          scrolltoSectionpress: (bool willpop, int index) {
                            scrollToId.animateTo(index.toString(),
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);
                            if (willpop) Navigator.pop(context);
                          }),
                    });
              })));
    });
  }

  // void _onHoverAppBar(bool isHovered, int index) {
  //   setState(() {
  //     appBarOnHoverd = isHovered;
  //     appBarHoveredIndex = appBarHoveredIndex == index ? 1000 : index;
  //   });
  // }

  void scrolltoSection(int index, bool willpop) {
    scrollToId.animateTo('$index',
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    if (willpop) Navigator.pop(context);
  }
}
