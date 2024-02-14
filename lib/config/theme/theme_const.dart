import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  static Color kPrimaryColor = const Color(0xFF78060D);
  static Color kPrimaryMediumShade = const Color(0xFFFFCACA);

  static Color kAppBgColor = const Color(0xFF0b0b0b);
  static Color kAppBgMediumShade = const Color(0xFFF7F7F7);
  static Color kAppBgDarkShade = const Color(0xFFF1F1F1);

  static Color kWhiteColor = const Color(0xFFFFFFFF);
  static Color kPeoBlackColor = const Color(0xFF000000);
  static Color kBlackColor = const Color(0xFF131213);
  static Color kBlackMediumShade = const Color(0xFF0F0F0F);

  static Color inputBoxTextColor = const Color(0xFFBFBFBF);

  static Color kGreyColor = const Color(0xFFABABAB);

  static Color kGreyMediumShade = const Color(0xFF5C5C5C);
  static Color kDarkGreyShade = const Color(0xFF363333);
  static Color kDarkerGreyShade = const Color(0xFF1B1B1B);
  static Color kStyledBtn = const Color(0xFF202020);

  static Color kGreyLightShade = const Color(0xFFBFBFBF);
  static Color kAppBgLighterShade = const Color(0xFFF6F6F6);
  static Color kAppBgLightestShade = const Color(0xFFEEEEEE);

  static Color kAppBarBorder = const Color(0xFFE3E3E3);

  static Color kSuccessColor = const Color(0xFF189516);
  static Color kWarnningColor = const Color(0XFFF5B14B);
  static Color kErrorColor = const Color(0XFFD1212C);

  static Color kButtonPrimaryColor = kPrimaryColor;
  static Color kButtonTextWhiteColor = const Color(0xFFFFFFFF);
  static Color kButtonTextPrimaryColor = kPrimaryColor;
}

TextStyle kWarningTextButtonText = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: const Color(0XFFD1212C),
    letterSpacing: 0.2);

TextStyle kwarningText = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: const Color(0XFFD1212C),
);

TextStyle kDarkGreySmalltextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: DarkTheme.kDarkGreyShade,
);

TextStyle kGreySmalltextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: DarkTheme.kGreyColor,
);

TextStyle kGreySmallBodytextStyle = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: FontWeight.w300,
  color: DarkTheme.kGreyColor,
);

TextStyle kGreySmallesttextStyle = GoogleFonts.poppins(
  fontSize: 11,
  fontWeight: FontWeight.w400,
  color: DarkTheme.kGreyColor,
);

TextStyle kSmalltextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: DarkTheme.kGreyColor,
);

TextStyle kPrimarySmalltextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: DarkTheme.kPrimaryColor,
);

//headding text style
TextStyle kTitlText = GoogleFonts.poppins(
  fontSize: 22,
  fontWeight: FontWeight.w600,
  color: DarkTheme.kGreyColor,
);

TextStyle kInputFieldHintText = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: DarkTheme.kGreyMediumShade,
);

TextStyle kInputFieldText = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  color: DarkTheme.inputBoxTextColor,
);

//filled buttons text style
TextStyle kFilledButtonTextstyle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: DarkTheme.kButtonTextWhiteColor,
);
