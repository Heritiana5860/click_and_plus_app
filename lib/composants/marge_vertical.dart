import 'package:flutter/material.dart';

class MargeVertical extends StatelessWidget {
  final double? height;
  final double? width;
  const MargeVertical({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
