import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/data/models/treatment_model.dart';
import 'package:ayur/presentation/bloc/registerbuildBloc/register_bloc.dart';
import 'package:ayur/presentation/screens/register/register.dart';
import 'package:ayur/presentation/screens/register/widgets/dropdowns.dart';
import 'package:ayur/presentation/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';

Future<void> showTreatmentDialog(
  ValueNotifier<List<AddedTreatmentModel>> treatmentList,
  ValueNotifier<int> treatmentChangeNotifier,
  BuildContext context,
  int? enteredmaleCount,
  int? enteredfemaleCount,
  Treatment? treatment
) async {
  int maleCount = enteredmaleCount ?? 0;
  int femaleCount = enteredfemaleCount ?? 0;
  int? selectedTreatmentId = treatment?.id;
  Treatment? selectedTreatment = treatment;
  await showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(28.sdp, 48.sdp, 28.sdp, 48.sdp),
              child: SizedBox(
                width: context.mediaQuerySize.width * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Choose Treatment",
                      style: TextStyle(
                        fontSize: 16.sdp,
                        fontWeight: FontWeight.w400,
                      ),
                      textColor: context.dynamicColor(
                        light: ColorResources.black,
                        dark: ColorResources.black,
                      ),
                    ),
                    SizedBox(height: 6.sdp),
                    BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            return 
                              treatmentDropdown(
                                selectedTreatmentId,
                                state is RegisterBuildState && state.isLoading == false? state.treatments : [],
                                (value) {
                                  selectedTreatment = value;
                                  selectedTreatmentId = value?.id;
                                },
                                context,
                              );
                          },
                        ),
           
                    SizedBox(height: 20.sdp),
                    TextWidget(
                      text: "Add Patients",
                      style: TextStyle(
                        fontSize: 16.sdp,
                        fontWeight: FontWeight.w400,
                      ),
                      textColor: context.dynamicColor(
                        light: ColorResources.black,
                        dark: ColorResources.black,
                      ),
                    ),
                    SizedBox(height: 6.sdp),
                    _buildCounterRow(
                      label: "Male",
                      count: maleCount,
                      context: context,
                      onIncrement: () => setState(() => maleCount++),
                      onDecrement: () {
                        if (maleCount > 0) setState(() => maleCount--);
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildCounterRow(
                      label: "Female",
                      count: femaleCount,
                      context: context,
                      onIncrement: () => setState(() => femaleCount++),
                      onDecrement: () {
                        if (femaleCount > 0) setState(() => femaleCount--);
                      },
                    ),
                    SizedBox(height: 30.sdp),
                    CommonButton(
                      buttoncolor: ColorResources.loginButtonGreen,
                      onTap: () {
                        if (selectedTreatment != null) {
                          addTreatment(selectedTreatment!, maleCount, femaleCount);
                        }
                      },
                      height: 50.sdp,
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
          );
        },
      );
    },
  );
}

Widget _buildCounterRow({
  required String label,
  required int count,
  required BuildContext context,
  required VoidCallback onIncrement,
  required VoidCallback onDecrement,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sdp),
            border: Border.all(color: ColorResources.greyBorder),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: label,
                  style: TextStyle(
                    fontSize: 14.sdp,
                    fontWeight: FontWeight.w300,
                  ),
                  textColor: context.dynamicColor(
                    light: ColorResources.black,
                    dark: ColorResources.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(width: 20.sdp),
      Row(
        children: [
          _circleButton(icon: Icons.remove, onTap: onDecrement),
          SizedBox(width: 8.sdp),
          Container(
            height: 50,
            // width: 120.sdp,
            decoration: BoxDecoration(
              border: Border.all(color: ColorResources.greyBorder),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.sdp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: count.toString(),
                    style: TextStyle(
                      fontSize: 14.sdp,
                      fontWeight: FontWeight.w300,
                    ),
                    textColor: context.dynamicColor(
                      light: ColorResources.black,
                      dark: ColorResources.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.sdp),
          _circleButton(icon: Icons.add, onTap: onIncrement),
        ],
      ),
    ],
  );
}

Widget _circleButton({required IconData icon, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40.sdp,
      width: 40.sdp,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorResources.greenShadow.withOpacity(0.2), // #00683733
            offset: const Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
        color: ColorResources.greenShadow,
        shape: BoxShape.circle,
      ),
      // padding: const EdgeInsets.all(6),
      child: Center(child: Icon(icon, color: ColorResources.white, size: 20)),
    ),
  );
}


void addTreatment(Treatment treatment, int maleCount, int femaleCount) {
  // check if already exists by id
  final exists = addedTreatments.value.any((e) => e.treatment.id == treatment.id);

  if (!exists) {
    addedTreatments.value.add(AddedTreatmentModel(treatment: treatment, maleCount: maleCount, femaleCount: femaleCount));
    treatmentChangeNotifier.value++;
  } else {
    final index = addedTreatments.value.indexWhere((e) => e.treatment.id == treatment.id);
    addedTreatments.value[index] = AddedTreatmentModel(treatment: treatment, maleCount: maleCount, femaleCount: femaleCount);
    treatmentChangeNotifier.value++;
  }
}