import 'package:flutter/material.dart';
import 'package:portofollio/screens/introview/components/appbar_section.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import '../../app.dart';
import 'components/end_drawer_section.dart';

class Introview extends StatefulWidget {
  const Introview(
      {super.key,
      required this.scrolltoSectionpress,
      required this.homeconstraints});
  final BoxConstraints homeconstraints;
  final Function(bool willpop, int index) scrolltoSectionpress;

  @override
  State<Introview> createState() => _IntroviewState();
}

class _IntroviewState extends State<Introview> {
  bool appBarOnHoverd = false;

  int appBarHoveredIndex = 0;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isMobile = screenWidth < 600;
        bool isTablet = screenWidth >= 600 && screenWidth < 1024;
        return Container(
            height: widget.homeconstraints.maxHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      ImagesAsset.leadbg), // Replace with your image path
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      backgroundColor.withOpacity(0.8), BlendMode.srcOver)),
            ),
            child: SizedBox(
              height: constraints.maxHeight / 2,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: Colors.transparent,
                endDrawer: EndDrawerSection(
                    appBarOnHoverd: appBarOnHoverd,
                    onHoverAppBar: _onHoverAppBar,
                    appBarHoveredIndex: appBarHoveredIndex,
                    scrolltoSectionpress: widget.scrolltoSectionpress),
                body: Column(
                  children: [
                    SizedBox(
                      height: deviceSize.height * 0.1,
                      child: isMobile || isTablet
                          ? Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: deviceSize.width * 0.03),
                                    child: InkWell(
                                      onTap: () =>
                                          widget.scrolltoSectionpress(false, 0),
                                      child: Text("Portfolio",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.0,
                                                  color: whiteColor,
                                                  fontFamily: "AquateScript")),
                                    )),
                                const Spacer(),
                                IconButton(
                                    onPressed: () => scaffoldKey.currentState
                                        ?.openEndDrawer(),
                                    icon: const Icon(Icons.menu))
                              ],
                            )
                          : AppbarSection(
                              appBarOnHoverd: appBarOnHoverd,
                              onHoverAppBar: _onHoverAppBar,
                              appBarHoveredIndex: appBarHoveredIndex,
                              scrolltoSectionpress:
                                  widget.scrolltoSectionpress),
                    ),
                    sizedHeight(deviceSize.height * 0.15),
                    Text("KALKIDAN\nDEMES",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                fontFamily: "Poppins",
                                letterSpacing: 1,
                                fontSize: deviceSize.height * 0.12,
                                fontWeight: FontWeight.w500,
                                color: whiteColor)),
                    Text("Software Engineer",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: const Color.fromARGB(204, 242, 249, 254))),
                    sizedHeight(deviceSize.height * 0.02),
                    SizedBox(
                      width: 150,
                      height: deviceSize.height * 0.06,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.all(deviceSize.width * 0.02),
                              shape: const StadiumBorder(
                                  side:
                                      BorderSide(color: whiteColor, width: 2)),
                              elevation: 0,
                              backgroundColor: Colors.transparent),
                          onPressed: () async {
                            final pdfBytes =
                                await loadPdfFromAssets('assets/example.pdf');
                            downloadPdf(pdfBytes, 'kalkidan_resume.pdf');
                          },
                          child: Text(
                            "Download Resume",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: deviceSize.height * 0.02,
                                fontWeight: FontWeight.w600),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          )),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => widget.scrolltoSectionpress(false, 1),
                      icon: const Icon(Icons.arrow_drop_down_circle,
                          size: 30, color: whiteColor),
                    ),
                    sizedHeight(deviceSize.height * 0.05),
                  ],
                ),
              ),
            ));
      },
    );
  }

  void _onHoverAppBar(bool isHovered, int index) {
    setState(() {
      appBarOnHoverd = isHovered;
      appBarHoveredIndex = appBarHoveredIndex == index ? 1000 : index;
    });
  }

  Future<Uint8List> loadPdfFromAssets(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

  // Function to trigger the download of the PDF
  void downloadPdf(Uint8List pdfBytes, String filename) {
    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..click();
    html.Url.revokeObjectUrl(url); // Clean up the URL object
  }
}
