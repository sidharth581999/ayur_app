
import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool? obsecureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final InputBorder? border;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? prefix;
  final InputBorder? errorBorder; 
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusErrorBorder;
  final bool? filled;
  final int? maxLines;
  final Color? fillColor;

  const CommonTextFormField({
    super.key, required this.controller, this.obsecureText, this.validator, this.border, required this.hintText, this.hintStyle, this.contentPadding, this.prefix, this.errorBorder, this.focusBorder, this.enabledBorder, this.focusErrorBorder, this.onChanged, this.errorStyle, this.textStyle, this.filled, this.maxLines, this.fillColor
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(

                controller: controller,
                obscureText: obsecureText?? false,
                validator: validator,
                maxLines: maxLines,
                decoration: InputDecoration(
                  
                  filled: filled?? false,
                  fillColor: fillColor,
                  
                  border: border?? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: hintText,
                  contentPadding: contentPadding?? EdgeInsetsDirectional.only(top: 20.sdp, bottom: 13.sdp, end: 10.sdp),
                  prefix: prefix?? SizedBox(width: 15.sdp),
                  hintStyle: hintStyle?? TextStyle(
                    fontSize: 14.sdp,
                    fontWeight: FontWeight.w400,
                    color: ColorResources.greyBorder
                  ),
                  focusedBorder: focusBorder?? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: ColorResources.greyBorder,
                      width: 1.5.sdp,
                    ),
                  ),
                  enabledBorder: enabledBorder?? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: ColorResources.greyBorder,
                      width: 1.0.sdp,
                    ),
                  ),
                  errorBorder: errorBorder?? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: ColorResources.errorRed,
                      width: 1.5.sdp,
                    ),
                  ),
                  focusedErrorBorder: focusErrorBorder?? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: ColorResources.errorRed,
                      width: 1.5.sdp,
                    ),
                  ),
                  errorStyle: errorStyle?? TextStyle(color: ColorResources.errorRed,fontSize: 12.sdp),
                //   suffixIcon: IconButton(
                //     icon: Icon(
                //       showChangeConfirmPasswordText.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                //       color: StarmanchColors.greyImageColor,
                //     ),
                //     onPressed: () {
                //       showChangeConfirmPasswordText.value = !showChangeConfirmPasswordText.value;
                //     },
                //   ),
                ),
                onChanged: onChanged,
                style: textStyle?? TextStyle(
                  fontSize: 12.sdp,
                  fontWeight: FontWeight.w500,
                    color: ColorResources.black
                ),
              );
  }
}

// class UnderLine extends StatelessWidget {
//   final double height;
//   final double? width;
//   final Color? color;
//    const UnderLine({
//     super.key, required this.height, this.width, required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(height: height, width: width?? double.maxFinite, color: color?? StarmanchColors.createRoomUnderline,);
//   }
// }
