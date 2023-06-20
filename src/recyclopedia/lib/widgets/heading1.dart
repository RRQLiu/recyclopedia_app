import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


/// Heading style 1
class Heading1 extends Text {
  Heading1(super.data, {super.key});

  @override
  final TextStyle style =
      GoogleFonts.poppins(fontSize: 27.0, fontWeight: FontWeight.bold);
      
  @override
  final TextAlign align = TextAlign.left;
}
