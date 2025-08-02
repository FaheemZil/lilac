import 'package:flutter/material.dart';

/// Vertical gap widget for consistent spacing
class VGap extends StatelessWidget {
  final double height;

  const VGap(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

/// Horizontal gap widget for consistent spacing
class HGap extends StatelessWidget {
  final double width;

  const HGap(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}
