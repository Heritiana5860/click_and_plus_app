import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTexte extends StatelessWidget {
  final String texte;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? decoration;

  const AppTexte({
    super.key,
    required this.texte,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.overflow,
    this.maxLines,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texte,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
        letterSpacing: -0.8
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
