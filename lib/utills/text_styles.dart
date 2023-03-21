// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget custom_text({String? text, TextStyle? style}) {
  return Text(text!, style: style);
}

Widget custom_text_with_center({String? text, TextStyle? style}) {
  return Text(text!, textAlign: TextAlign.center, style: style);
}

class CustomStyle {
  style_12_reguler(Color color) => GoogleFonts.roboto(
      fontSize: 12, color: color, fontWeight: FontWeight.w400);
  style_12_medium(Color color) => GoogleFonts.roboto(
      fontSize: 12, color: color, fontWeight: FontWeight.w500);
  style_14_reguler(Color color) => GoogleFonts.roboto(
      fontSize: 14, color: color, fontWeight: FontWeight.w400);
  style_14_medium(Color color) => GoogleFonts.roboto(
      fontSize: 14, color: color, fontWeight: FontWeight.w500);
  style_15_reguler(Color color) => GoogleFonts.roboto(
      fontSize: 15, color: color, fontWeight: FontWeight.w400);
  style1_15_reguler(Color color) => GoogleFonts.roboto(
      height: 1.4, fontSize: 15, color: color, fontWeight: FontWeight.w400);
  style_15_medium(Color color) => GoogleFonts.roboto(
      fontSize: 15, color: color, fontWeight: FontWeight.w500);
  style_16_reguler(Color color) => GoogleFonts.roboto(
      fontSize: 16, color: color, fontWeight: FontWeight.w400);
  style_16_bold(Color color) => GoogleFonts.roboto(
      fontSize: 16, color: color, fontWeight: FontWeight.bold);
  style_17_reguler(Color color) => GoogleFonts.roboto(
      fontSize: 17, color: color, fontWeight: FontWeight.w400);
  style_17_bold(Color color) => GoogleFonts.roboto(
      fontSize: 17, color: color, fontWeight: FontWeight.bold);
  style_17_medium(Color color) => GoogleFonts.roboto(
      fontSize: 17, color: color, fontWeight: FontWeight.w500);
  style_16_medium(Color color) => GoogleFonts.roboto(
      fontSize: 16, color: color, fontWeight: FontWeight.w500);
  style_18_reguler(Color color) => GoogleFonts.roboto(
      fontSize: 18, color: color, fontWeight: FontWeight.w400);
  style_18_medium(Color color) => GoogleFonts.roboto(
      fontSize: 18, color: color, fontWeight: FontWeight.w500);
  style_22_reguler(Color color) => GoogleFonts.roboto(
      fontSize: 22, color: color, fontWeight: FontWeight.w400);
  style_22_medium(Color color) => GoogleFonts.roboto(
      fontSize: 22, color: color, fontWeight: FontWeight.w500);
  style_22_bold(Color color) => GoogleFonts.roboto(
      fontSize: 22, color: color, fontWeight: FontWeight.bold);
}
