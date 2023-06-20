import 'package:flutter/material.dart';

/// Heading style 2
class Heading2 extends Text {
  const Heading2(super.data, {super.key});

  @override
  final TextStyle style =
      const TextStyle(fontSize:15, fontWeight: FontWeight.bold);
}
