import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppsFontStyle {
  static var appLogoFontStyle = GoogleFonts.pacifico(
    color: AppColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
  );

  // App Bar Style
  static get appBarTitleFontStyle => GoogleFonts.poppins(
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      letterSpacing: 1,
      fontSize: 18.sp);

  // title Style
  static var titleFontStyle = GoogleFonts.poppins(
      color: AppColors.black, fontWeight: FontWeight.w700, fontSize: 16.sp);

  // subtitle font
  static var subTitleFontStyle = GoogleFonts.poppins(
      color: AppColors.secondaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 13.sp);

  // Tab Bar Font Style
  static var tabBarFontStyle = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

  // Tab bar Unselect Color
  static var unselectedLabelStyle =
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w600);

  // Medium Bold Font Style
  static var mediumBoldFontStyle = GoogleFonts.poppins(
      fontSize: 13, color: AppColors.black, fontWeight: FontWeight.bold);

  // Medium  Font Style
  static var mediumFontStyle = GoogleFonts.poppins(
      fontSize: 13, color: AppColors.black, fontWeight: FontWeight.normal);

  static var titleRobotFontStyle = GoogleFonts.roboto(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
      fontSize: 16.sp);

  static var categoryFontStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w700, fontSize: 13.sp, color: AppColors.black);

  static var hintTextFontStyle = GoogleFonts.poppins(
    color: AppColors.grey,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    fontSize: 13.sp,
  );

  static var hintTextReviewFontStyle = GoogleFonts.poppins(
    color: AppColors.grey,
    fontWeight: FontWeight.w700,
    fontSize: 11.sp,
  );
  static var bookingTileFontStyle = GoogleFonts.poppins(
    color: AppColors.black.withOpacity(.6),
    fontWeight: FontWeight.w600,
    fontSize: 12.sp,
  );

  static var hintBoldFontStyle = GoogleFonts.poppins(
    color: AppColors.black.withOpacity(.54),
    fontWeight: FontWeight.w700,
    fontSize: 12.sp,
  );

// Large Font Style
  static var largeBoldFontStyle = GoogleFonts.poppins(
      fontSize: 14, color: AppColors.black, fontWeight: FontWeight.bold);

  static var buttonFontStyle = GoogleFonts.poppins(
      fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w800);

  static var mediumNormalFontStyle = GoogleFonts.poppins(
      fontSize: 12, color: AppColors.black, fontWeight: FontWeight.w600);

  // Small  Font Style
  static var smallFontStyle = GoogleFonts.poppins(
      color: Colors.black45, fontWeight: FontWeight.w600, fontSize: 11.sp);

  // Small Bold Font Style
  static var smallBoldFontStyle = GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 11.sp);
}
