import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/data/models/branch_model.dart';
import 'package:ayur/data/models/treatment_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';




Widget locationDropdown(
  String? value,
  List<String> items,
  Function(String?) onChanged,
  BuildContext context,
) {
  return DropdownButtonFormField<String>(
    value: value,
    dropdownColor: ColorResources.greyContainer,
    decoration: dropdownInputDecoration("Select location"),
    icon: Icon(
      Icons.keyboard_arrow_down_sharp,
      color: context.dynamicColor(
        light: ColorResources.lightGreenText,
        dark: ColorResources.lightGreenText,
      ),
      size: 22.sdp,
    ),
    style: TextStyle(
      fontSize: 12.sdp,
      fontWeight: FontWeight.w600,
      color: context.dynamicColor(
        light: ColorResources.black,
        dark: ColorResources.black,
      ),
    ),
    onChanged: onChanged,
    items: items
        .map(
          (e) => DropdownMenuItem<String>(
            value: e,
            child: TextWidget(
              text: e,
              style: TextStyle(fontSize: 12.sdp, fontWeight: FontWeight.w400),
              textColor: context.dynamicColor(
                light: ColorResources.black,
                dark: ColorResources.black,
              ),
            ),
          ),
        )
        .toList(),
  );
}

//branch dropdown
Widget branchDropdown(
  int? value,
  List<Branch> items,
  Function(int?) onChanged,
  BuildContext context,
) {
  return DropdownButtonFormField<int>(
    value: value,
    dropdownColor: ColorResources.greyContainer,
    decoration: dropdownInputDecoration("Select branch"),
    icon: Icon(
      Icons.keyboard_arrow_down_sharp,
      color: context.dynamicColor(
        light: ColorResources.greyBorder,
        dark: ColorResources.greyBorder,
      ),
    ),
    style: TextStyle(
      fontSize: 12.sdp,
      fontWeight: FontWeight.w600,
      color: context.dynamicColor(
        light: ColorResources.black,
        dark: ColorResources.black,
      ),
    ),
    onChanged: onChanged,
    items: items
        .map(
          (e) => DropdownMenuItem<int>(
            value: e.id,
            child: TextWidget(
              text: e.name,
              style: TextStyle(fontSize: 12.sdp, fontWeight: FontWeight.w400),
              textColor: context.dynamicColor(
                light: ColorResources.black,
                dark: ColorResources.black,
              ),
            ),
          ),
        )
        .toList(),
        validator: (value) {
          if (value == null) {
            return "Field can't be empty";
          } return null;
        },
  );
}

InputDecoration dropdownInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle:  TextStyle(
      fontSize: 14.sdp,
      fontWeight: FontWeight.w300,
      color: ColorResources.greyText,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 12.sdp),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sdp),
      borderSide: BorderSide(color: ColorResources.greyBorder, width: 1.5.sdp),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sdp),
      borderSide: BorderSide(color: ColorResources.greyBorder, width: 1.0.sdp),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sdp),
      borderSide: BorderSide(color: ColorResources.errorRed, width: 1.5.sdp),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.sdp),
      borderSide: BorderSide(color: ColorResources.errorRed, width: 1.5.sdp),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: ColorResources.greyBorder),
      borderRadius: BorderRadius.circular(8.sdp),
    ),
  );
}


//treatment dropdown
Widget treatmentDropdown(
  int? value,
  List<Treatment> items,
  Function(Treatment?) onChanged,
  BuildContext context,
) {
  return DropdownButtonFormField<int>(
    value: value,
     isExpanded: true,
    dropdownColor: ColorResources.greyContainer,
    decoration: dropdownInputDecoration("Select treatment"),
    icon: Icon(
      Icons.keyboard_arrow_down_sharp,
      color: context.dynamicColor(
        light: ColorResources.lightGreenText,
        dark: ColorResources.lightGreenText,
      ),
      size: 22.sdp,
    ),
    style: TextStyle(
      fontSize: 12.sdp,
      fontWeight: FontWeight.w600,
      color: context.dynamicColor(
        light: ColorResources.black,
        dark: ColorResources.black,
      ),
    ),
    onChanged: (id) {
      final selected =
          items.firstWhere((e) => e.id == id, orElse: () => items.first);
      print("Selected Treatment → id: ${selected.id}, name: ${selected.name}");
      onChanged(selected);
    },
    items: items
        .map(
          (e) => DropdownMenuItem<int>(
            value: e.id,
            child: TextWidget(
              text: e.name,
              style: TextStyle(fontSize: 12.sdp, fontWeight: FontWeight.w400),
              textColor: context.dynamicColor(
                light: ColorResources.black,
                dark: ColorResources.black,
              ),
            ),
          ),
        )
        .toList(),
  );
}