import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  // Headings
  static TextStyle heading1Regular = GoogleFonts.cairo(
    fontSize: 48.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle heading1Bold = GoogleFonts.cairo(
    fontSize: 48.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle heading2Regular = GoogleFonts.cairo(
    fontSize: 40.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle heading2Bold = GoogleFonts.cairo(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle heading3Regular = GoogleFonts.cairo(
    fontSize: 33.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle heading3Bold = GoogleFonts.cairo(
    fontSize: 33.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle heading4Regular = GoogleFonts.cairo(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle heading4Bold = GoogleFonts.cairo(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle heading5Regular = GoogleFonts.cairo(
    fontSize: 23.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle heading5Bold = GoogleFonts.cairo(
    fontSize: 23.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  // Body
  static TextStyle bodyLargeRegular = GoogleFonts.cairo(
    fontSize: 19.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle bodyLargeBold = GoogleFonts.cairo(
    fontSize: 19.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle bodyBaseRegular = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle bodyBaseBold = GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  static TextStyle bodySmallRegular = GoogleFonts.cairo(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  static TextStyle bodySmallBold = GoogleFonts.cairo(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    height: 1.7,
  );

  static TextStyle bodyXSmallRegular = GoogleFonts.cairo(
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle bodyXSmallBold = GoogleFonts.cairo(
    fontSize: 11.sp,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );
}
