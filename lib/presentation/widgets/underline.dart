
import 'package:ayur/application/core/theme/colors.dart';
import 'package:flutter/material.dart';

class UnderLine extends StatelessWidget {
  final double height;
  final double? width;
  final Color? color;
   const UnderLine({
    super.key, required this.height, this.width, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: height, width: width?? double.maxFinite, color: color?? ColorResources.greyBorder,);
  }
}