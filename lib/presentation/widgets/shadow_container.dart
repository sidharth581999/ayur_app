import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final Widget widget;
  final Color? bg;
  final double? borderRadious; 
  final double? height;
  final double? width;
  final List<BoxShadow>? boxShadowColor;
  final VoidCallback? onTap;
  const ShadowContainer({super.key, required this.widget, this.bg, this.borderRadious, this.height, this.width, this.boxShadowColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        height: height,
        // width: width,
        decoration: BoxDecoration(
          color: bg?? context.dynamicColor(
              light: ColorResources.white ,
              dark: ColorResources.white),
          boxShadow: boxShadowColor?? [
            BoxShadow(
          offset: Offset(2, 2),
          blurRadius: 4,
          spreadRadius: 0,
          color: ColorResources.greenShadow.withOpacity(0.2),
        ),
          ],
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular( borderRadious?? 16.sdp),
        ),
        duration: const Duration(milliseconds: 300),
        child: widget,
      ),
    );
  }
}