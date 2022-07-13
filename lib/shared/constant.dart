import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF2B637B);
const Color secondaryColor = Color(0xFFE2E3E4);

Text textPoppins(var label, double size, Color color, FontWeight fontWeight) {
  return Text(
    label,
    style: stylePoppins(
      size,
      color,
      fontWeight,
    ),
  );
}

TextStyle stylePoppins(double size, Color color, FontWeight fontWeight) {
  return GoogleFonts.poppins(
    fontWeight: fontWeight,
    fontSize: size,
    color: color,
  );
}
