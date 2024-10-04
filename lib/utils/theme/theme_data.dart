import 'package:flutter/material.dart';

import '../utils.dart';
import 'button_theme.dart';
import 'input_decoration_theme.dart';

const AppBarTheme appBarLightTheme = AppBarTheme(
//  backgroundColor: secondaryColor,
  elevation: 0,
  iconTheme: IconThemeData(color: whiteColor),
  titleTextStyle:
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: whiteColor),
);

const AppBarTheme appBarDarkTheme = AppBarTheme(
  //backgroundColor: blackColor,
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.white),
  titleTextStyle: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  ),
);

ScrollbarThemeData scrollbarThemeData = ScrollbarThemeData(
  trackColor: MaterialStateProperty.all(primaryColor),
);

CardTheme lightcardTheme = const CardTheme(color: Colors.white);

CardTheme darkCardTheme = const CardTheme(color: blackColor);

ProgressIndicatorThemeData lightprogressIndicatorThemeData =
    const ProgressIndicatorThemeData(color: whiteColor);

ProgressIndicatorThemeData darkprogressIndicatorThemeData =
    const ProgressIndicatorThemeData(color: Colors.white);

DataTableThemeData dataTableLightThemeData = DataTableThemeData(
  columnSpacing: 24,
  headingRowColor: MaterialStateProperty.all(Colors.black12),
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
    border: Border.all(color: Colors.black12),
  ),
  dataTextStyle: const TextStyle(
      fontSize: 12, fontWeight: FontWeight.w500, color: blackColor),
);

DataTableThemeData dataTableDarkThemeData = DataTableThemeData(
  columnSpacing: 24,
  headingRowColor: MaterialStateProperty.all(Colors.white10),
  decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadius)),
    border: Border.all(color: Colors.white10),
  ),
  dataTextStyle: const TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 12,
  ),
);

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
      brightness: Brightness.light,
      fontFamily: "lato",
      // primarySwatch: MaterialColor(0, {0: Colors.green.shade900}),
      primaryColor: primaryColor,
      // scaffoldBackgroundColor: primaryColor,
      scaffoldBackgroundColor: Color(0XFFf2f2f5),
      iconTheme: const IconThemeData(color: whiteColor),
      // textTheme: const TextTheme(
      //   bodyMedium: TextStyle(color: whiteColor),
      // ),
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme:
          checkboxThemeData.copyWith(side: const BorderSide(color: whiteColor)),
      //appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
      cardTheme: lightcardTheme,
      progressIndicatorTheme: lightprogressIndicatorThemeData);
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
      brightness: Brightness.dark,
      fontFamily: "lato",
      //  primarySwatch: const MaterialColor(0, {0: Colors.green}),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: blackColor,
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: blackColor60),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(borderColor: whileColor20),
      inputDecorationTheme: darkInputDecorationTheme,
      checkboxTheme: checkboxThemeData,
      appBarTheme: appBarDarkTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableDarkThemeData,
      cardTheme: darkCardTheme,
      progressIndicatorTheme: darkprogressIndicatorThemeData);
}
