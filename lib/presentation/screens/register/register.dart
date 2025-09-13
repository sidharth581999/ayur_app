// ignore_for_file: deprecated_member_use

import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/status_bar_styler.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/presentation/widgets/common_button.dart';
import 'package:ayur/presentation/widgets/common_textformfield.dart';
import 'package:ayur/presentation/widgets/shadow_container.dart';
import 'package:ayur/presentation/widgets/underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController whatsupController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController adwanceController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  ValueNotifier<String?> _selectedPayment = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StatusBarStyler(
        backgroundColor: ColorResources.white,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: context.dynamicColor(
              light: ColorResources.white,
              dark: ColorResources.white,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.sdp),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      AppAssets.notificationEnabled,
                      height: 22.sdp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.sdp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextWidget(
                    text: "Register",
                    style: TextStyle(
                      fontSize: 24.sdp,
                      fontWeight: FontWeight.w600,
                    ),
                    textColor: context.dynamicColor(
                      light: ColorResources.black,
                      dark: ColorResources.black,
                    ),
                  ),
                ),
                SizedBox(height: 12.sdp),
                UnderLine(height: 1.sdp, color: null),
                SizedBox(height: 12.sdp),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(
                      children: [
                        _textWithHeadder(
                          context,
                          "Name",
                          CommonTextFormField(
                            controller: nameController,
                            hintText: "Enter your name",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        _textWithHeadder(
                          context,
                          "Whatsapp Number",
                          CommonTextFormField(
                            controller: whatsupController,
                            hintText: "Enter your number",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        _textWithHeadder(
                          context,
                          "Address",
                          CommonTextFormField(
                            controller: addressController,
                            hintText: "Enter your address",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        _dropdownWithHeadder(
                          context,
                          "Location",
                          locationDropdown(
                            "a",
                            ["a", "b", "c"],
                            (value) {},
                            context,
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        _dropdownWithHeadder(
                          context,
                          "Branch",
                          locationDropdown(
                            "a",
                            ["a", "b", "c"],
                            (value) {},
                            context,
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        TextWidget(
                          text: "Treatments",
                          style: TextStyle(
                            fontSize: 16.sdp,
                            fontWeight: FontWeight.w400,
                          ),
                          textColor: context.dynamicColor(
                            light: ColorResources.black,
                            dark: ColorResources.black,
                          ),
                        ),
                        SizedBox(height: 5.sdp),
                        AnimatedContainer(
                          duration: Duration(microseconds: 400),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            border: Border.all(style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(10.sdp),
                            color: ColorResources.greyContainer,
                          ),
                          child: Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                    20.sdp,
                                    15.sdp,
                                    10.sdp,
                                    15.sdp,
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: "1.",
                                        style: TextStyle(
                                          fontSize: 16.sdp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textColor: context.dynamicColor(
                                          light: ColorResources.black,
                                          dark: ColorResources.black,
                                        ),
                                      ),
                                      SizedBox(width: 10.sdp),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: TextWidget(
                                                    text: "Sidagt hjb Yuiin J",
                                                    style: TextStyle(
                                                      fontSize: 16.sdp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textColor: context
                                                        .dynamicColor(
                                                          light: ColorResources
                                                              .black,
                                                          dark: ColorResources
                                                              .black,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(width: 5.sdp),
                                                CircleAvatar(
                                                  radius: 11.sdp,
                                                  backgroundColor:
                                                      ColorResources.lightRedBg
                                                          .withOpacity(0.5),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.close,
                                                      size: 14.sdp,
                                                      color:
                                                          ColorResources.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 4.sdp),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                _countRow(context, "Male", "5"),
                                                _countRow(
                                                  context,
                                                  "Female",
                                                  "3",
                                                ),
                                                SvgPicture.asset(
                                                  AppAssets.editPen,
                                                  height: 20.sdp,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.sdp),
                        ShadowContainer(
                          borderRadious: 8,
                          height: 40,
                          bg: ColorResources.lightButtonGreen.withOpacity(0.3),
                          width: double.maxFinite,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 25),
                              SizedBox(width: 6.sdp),
                              TextWidget(
                                text: "Add Treatments",
                                style: TextStyle(
                                  fontSize: 16.sdp,
                                  fontWeight: FontWeight.w500,
                                ),
                                textColor: context.dynamicColor(
                                  light: ColorResources.black,
                                  dark: ColorResources.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        _textWithHeadder(
                          context,
                          "Total Amount",
                          CommonTextFormField(
                            controller: amountController,
                            hintText: "Enter total amount",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        _textWithHeadder(
                          context,
                          "Discount Amount",
                          CommonTextFormField(
                            controller: discountController,
                            hintText: "Enter discount amount",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        TextWidget(
                          text: "Payment Option",
                          style: TextStyle(
                            fontSize: 16.sdp,
                            fontWeight: FontWeight.w400,
                          ),
                          textColor: context.dynamicColor(
                            light: ColorResources.black,
                            dark: ColorResources.black,
                          ),
                        ),
                        SizedBox(height: 5.sdp),
                        Row(
                          children: [
                            _radioRow(context, "Cash", "Cash"),
                            _radioRow(context, "Card", "Card"),
                            _radioRow(context, "UPI", "UPI"),
                          ],
                        ),
                        SizedBox(height: 12.sdp),
                        _textWithHeadder(
                          context,
                          "Adwance Amount",
                          CommonTextFormField(
                            controller: adwanceController,
                            hintText: "Enter adwance amont",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        _textWithHeadder(
                          context,
                          "Balance Amount",
                          CommonTextFormField(
                            controller: balanceController,
                            hintText: "Enter balance amount",
                          ),
                        ),
                        SizedBox(height: 12.sdp),

                        _textWithHeadder(
                          context,
                          "Treatment Date",
                          CommonTextFormField(
                            isReadonly: true,
                            controller: dateController,
                            hintText: "Pick date",
                            suffix: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.calander,
                                  color: ColorResources.lightGreenText,
                                  height: 22.sdp,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: _textWithHeadder(
                                  context,
                                  "Treatment Time",
                                  CommonTextFormField(
                                    isReadonly: true,
                                    controller: dateController,
                                    hintText: "Hour",
                                    suffix: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          color: ColorResources.lightGreenText,
                                          size: 22.sdp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.sdp),
                              Expanded(
                                child: _textWithHeadder(
                                  context,
                                  "",
                                  CommonTextFormField(
                                    isReadonly: true,
                                    controller: dateController,
                                    hintText: "Minute",
                                    suffix: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.timer,
                                          color: ColorResources.lightGreenText,
                                          size: 22.sdp,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.sdp),

                        CommonButton(
                          buttoncolor: ColorResources.loginButtonGreen,
                          onTap: () {},
                          height: 45.sdp,
                          width: double.maxFinite,
                          borderRadious: 8.5,
                          child: Center(
                            child: TextWidget(
                              text: "Save",
                              style: TextStyle(
                                fontSize: 17.sdp,
                                fontWeight: FontWeight.w600,
                              ),
                              textColor: context.dynamicColor(
                                light: ColorResources.white,
                                dark: ColorResources.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _radioRow(BuildContext context, String label, String value) {
    return Row(
      children: [
        Radio<String>(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          value: value,
          groupValue: _selectedPayment.value,
          activeColor: ColorResources.lightButtonGreen, // selected color
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return ColorResources.lightGreenText;
            }
            return ColorResources.greyBorder; // unselected border
          }),
          onChanged: (value) {
            _selectedPayment.value = value!;
          },
        ),
        TextWidget(
          text: label,
          style: TextStyle(fontSize: 15.sdp, fontWeight: FontWeight.w400),
          textColor: context.dynamicColor(
            light: ColorResources.black,
            dark: ColorResources.black,
          ),
        ),
      ],
    );
  }

  Row _countRow(BuildContext context, String label, String count) {
    return Row(
      children: [
        TextWidget(
          text: label,
          style: TextStyle(fontSize: 15.sdp, fontWeight: FontWeight.w400),
          textColor: context.dynamicColor(
            light: ColorResources.black,
            dark: ColorResources.black,
          ),
        ),
        SizedBox(width: 5.sdp),
        Container(
          height: 26.sdp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.sdp),
            border: Border.all(color: ColorResources.greyBorder),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sdp),
            child: TextWidget(
              text: count,
              style: TextStyle(fontSize: 15.sdp, fontWeight: FontWeight.w400),
              textColor: context.dynamicColor(
                light: ColorResources.black,
                dark: ColorResources.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _textWithHeadder(
    BuildContext context,
    String text,
    CommonTextFormField textField,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: text,
          style: TextStyle(fontSize: 16.sdp, fontWeight: FontWeight.w400),
          textColor: context.dynamicColor(
            light: ColorResources.black,
            dark: ColorResources.black,
          ),
        ),
        SizedBox(height: 5.sdp),
        textField,
      ],
    );
  }

  Column _dropdownWithHeadder(
    BuildContext context,
    String text,
    Widget dropdown,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: text,
          style: TextStyle(fontSize: 16.sdp, fontWeight: FontWeight.w400),
          textColor: context.dynamicColor(
            light: ColorResources.black,
            dark: ColorResources.black,
          ),
        ),
        SizedBox(height: 5.sdp),
        dropdown,
      ],
    );
  }
}

Widget locationDropdown(
  String value,
  List<String> items,
  Function(String?) onChanged,
  BuildContext context,
) {
  return DropdownButtonFormField<String>(
    value: value,
    dropdownColor: ColorResources.greyContainer,
    decoration: dropdownInputDecoration(),
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
  String value,
  List<String> items,
  Function(String?) onChanged,
  BuildContext context,
) {
  return DropdownButtonFormField<String>(
    value: value,
    dropdownColor: ColorResources.greyContainer,
    decoration: dropdownInputDecoration(),
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

InputDecoration dropdownInputDecoration() {
  return InputDecoration(
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
