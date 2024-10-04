import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

const appName = "Kalkidan's Resume";
Size deviceSize(BuildContext context) => MediaQuery.of(context).size;
const double defaultPadding = 16.0;
const Duration defaultDuration = Duration(milliseconds: 300);

var scaffoldKey = GlobalKey<ScaffoldState>();

//log in debugmode only
bool debug = true;
printDebug(dynamic message) {
  //if (DEBUG) log(message.toString());
  try {
    if (debug) log(int.parse(message.toString()));
  } catch (_) {}
}

SizedBox sizedHeight(double height) => SizedBox(height: height);

SizedBox sizedWidth(double width) => SizedBox(width: width);

const bgLight = Color.fromARGB(255, 237, 250, 238);

const Color error = Color(0xBBE64A19); //Color(0xBBE65100); //Color(0xC1FF2D2D);
const Color warning = Color(0xBBE39219); //Color(0xC1FF2D2D);
const Color success = Color(0xBB689F38); //Color(0xC1FF2D2D);

const Color primaryColor = Color.fromARGB(255, 27, 49, 240);
const Color primaryDark = Color(0XFF085387);
const Color backgroundColor = Color.fromARGB(255, 7, 27, 98);
//Color.fromRGBO(33, 125, 187, 0.8); //light blue
const Color whiteColor = Colors.white;
const Color whileColor80 = Color(0xFFCCCCCC);
const Color whileColor60 = Color(0xFF999999);
const Color whileColor40 = Color(0xFF666666);
const Color whileColor20 = Color(0xFF333333);
const Color whileColor10 = Color(0xFF191919);
const Color whileColor5 = Color(0xFF0D0D0D);

const Color greyColor = Color(0xFFB8B5C3);
const Color lightGreyColor = Color(0xFFF8F8F9);
const Color darkGreyColor = Color(0xFF1C1C25);

const Color blackColor = Color(0xFF16161E);
const Color blackColor80 = Color(0xFF45454B);
const Color blackColor60 = Color(0xFF737378);
const Color blackColor40 = Color(0xFFA2A2A5);
const Color blackColor20 = Color(0xFFD0D0D2);
const Color blackColor10 = Color(0xFFE8E8E9);
const Color blackColor5 = Color(0xFFF3F3F4);

const double defaultBorderRadius = 12.0;

List<String> navbarList = [
  "",
  "About",
  "Experience",
  "Education",
  "Projects",
  "Skills",
  "Contact",
];

String capitalize(String string) {
  return string.isEmpty
      ? ""
      : "${string[0].toUpperCase()}${string.substring(1).toLowerCase()}";
}

String capitalizeUserName(String string) {
  try {
    return string.isEmpty
        ? ""
        : string
            .replaceAll('  ', '')
            .split(' ')
            .map((element) =>
                "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
            .join(" ");
  } catch (e) {
    return string.isEmpty
        ? ""
        : "${string[0].toUpperCase()}${string.substring(1).toLowerCase()}";
  }
}

class ImagesAsset {
  static String leadbg = "assets/images/lead-bg.jpg";
  static String playstore = "assets/images/playstore.svg";
  static String appstore = "assets/images/appstore.svg";

  static List<String> imageLinks() => [
        "assets/images/github.svg",
        "assets/images/instagram.svg",
        "assets/images/linkedin.svg",
        "assets/images/twitter.svg",
      ];
  CachedNetworkImageProvider cachedNetworkImageProvider(String img) {
    return CachedNetworkImageProvider(img);
  }

  CachedNetworkImage cachedNetworkImage(String image) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,
            colorFilter: const ColorFilter.mode(
              Colors.transparent,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(
        strokeWidth: 2.0,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
