import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/presentation/screens/register/register.dart';
import 'package:ayur/presentation/screens/register/widgets/treatment_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



  Column textWithHeadder(
    BuildContext context,
    String text,
    Widget textField,
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

  Column dropdownWithHeadder(
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

  
  Widget addedTreatmentTile(BuildContext context, int index, AddedTreatmentModel treatment) {
    return AnimatedContainer(
                                  duration: Duration(microseconds: 400),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(

                                    color: ColorResources.greyContainer,
                                  ),
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
                                              text: "$index.",
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
                                                          text: treatment.treatment.name,
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
                                                      InkWell(
                                                        onTap: () {
                                                          addedTreatments.value.removeAt(index-1);
                                                          treatmentChangeNotifier.value++;
                                                        },
                                                        child: CircleAvatar(
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
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 4.sdp),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      _countRow(context, "Male", "${treatment.maleCount}"),
                                                      _countRow(
                                                        context,
                                                        "Female",
                                                        "${treatment.femaleCount}",
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          showTreatmentDialog(addedTreatments, treatmentChangeNotifier, context, treatment.maleCount, treatment.femaleCount, treatment.treatment);
                                                        },
                                                        child: SvgPicture.asset(
                                                          AppAssets.editPen,
                                                          height: 20.sdp,
                                                        ),
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
