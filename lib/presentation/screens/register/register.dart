// ignore_for_file: deprecated_member_use

import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/date_time_picker.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/status_bar_styler.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/data/models/treatment_model.dart';
import 'package:ayur/presentation/bloc/registerClickBloc/register_click_bloc_bloc.dart';
import 'package:ayur/presentation/bloc/registerbuildBloc/register_bloc.dart';
import 'package:ayur/presentation/screens/register/widgets/dropdowns.dart';
import 'package:ayur/presentation/screens/register/widgets/treatment_popup.dart';
import 'package:ayur/presentation/screens/register/widgets/widgets.dart';
import 'package:ayur/presentation/widgets/common_button.dart';
import 'package:ayur/presentation/widgets/common_textformfield.dart';
import 'package:ayur/presentation/widgets/shadow_container.dart';
import 'package:ayur/presentation/widgets/underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


ValueNotifier<List<AddedTreatmentModel>> addedTreatments = ValueNotifier([]);
  ValueNotifier<int> treatmentChangeNotifier = ValueNotifier(0);

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController whatsupController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController adwanceController = TextEditingController();
  TextEditingController balanceController = TextEditingController();
  ValueNotifier<DateTime?> dateController = ValueNotifier(null);
  ValueNotifier<TimeOfDay?> timeController = ValueNotifier(null);
  final ValueNotifier<String?> _selectedPayment = ValueNotifier(null);
  int? _selectedBranch;
  String? _selectedLocation;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StatusBarStyler(
        backgroundColor: ColorResources.white,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
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
            padding: EdgeInsets.only(top: 8.sdp, bottom: 12.sdp),
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
                        textWithHeadder(
                          context,
                          "Name",
                          CommonTextFormField(
                            controller: nameController,
                            hintText: "Enter your name",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        textWithHeadder(
                          context,
                          "Whatsapp Number",
                          CommonTextFormField(
                            controller: whatsupController,
                            hintText: "Enter your number",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        textWithHeadder(
                          context,
                          "Address",
                          CommonTextFormField(
                            controller: addressController,
                            hintText: "Enter your address",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        dropdownWithHeadder(
                          context,
                          "Location",
                          locationDropdown(
                            _selectedLocation,
                            ["Perambra", "Quilandy", "Kozhikode"],
                            (value) {},
                            context,
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            return dropdownWithHeadder(
                              context,
                              "Branch",
                              branchDropdown(
                                _selectedBranch,
                                state is RegisterBuildState && state.isLoading == false? state.branches : [],
                                (value) {},
                                context,
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 12.sdp),

                        ValueListenableBuilder(
                          valueListenable: treatmentChangeNotifier,
                          builder: (context, value, child) =>
                          addedTreatments.value.isEmpty? SizedBox() :
                             Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 12.sdp),
                                  decoration: BoxDecoration(
                                    border: Border.all(style: BorderStyle.none),
                                    borderRadius: BorderRadius.circular(10.sdp),
                                    color: ColorResources.greyContainer,
                                  ),
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => addedTreatmentTile(context, index+1, addedTreatments.value[index]), 
                                    separatorBuilder: (context, index) => UnderLine(height: 1, color: ColorResources.greyContainer), itemCount: addedTreatments.value.length),
                                ),
                                SizedBox(height: 10.sdp),
                              ],
                            )
                        ),
                        ShadowContainer(
                          borderRadious: 8,
                          height: 40,
                          onTap: () => showTreatmentDialog(addedTreatments, treatmentChangeNotifier, context, null, null, null),
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
                        textWithHeadder(
                          context,
                          "Total Amount",
                          CommonTextFormField(
                            controller: amountController,
                            hintText: "Enter total amount",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        textWithHeadder(
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
                        ValueListenableBuilder(
                          valueListenable: _selectedPayment,
                          builder: (context, value, child) => 
                          Row(
                            children: [
                              _radioRow(context, "Cash", "Cash"),
                              _radioRow(context, "Card", "Card"),
                              _radioRow(context, "UPI", "UPI"),
                            ],
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        textWithHeadder(
                          context,
                          "Adwance Amount",
                          CommonTextFormField(
                            controller: adwanceController,
                            hintText: "Enter adwance amont",
                          ),
                        ),
                        SizedBox(height: 12.sdp),
                        textWithHeadder(
                          context,
                          "Balance Amount",
                          CommonTextFormField(
                            controller: balanceController,
                            hintText: "Enter balance amount",
                          ),
                        ),
                        SizedBox(height: 12.sdp),

                        ValueListenableBuilder(
                          valueListenable: dateController,
                          builder: (context, value, child) => 
                          textWithHeadder(
                            context,
                            "Treatment Date",
                            CommonTextFormField(
                              onTap: () async{
                                final date = await pickDate(context, initialDate: dateController.value);
                                dateController.value = date;
                              },
                              isReadonly: true,
                              controller: dateController.value == null? TextEditingController() : TextEditingController(text: dateController.value.toString().substring(0,10)),
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
                        ),
                        SizedBox(height: 12.sdp),
                        Expanded(
                          child: ValueListenableBuilder(
                            valueListenable: timeController,
                            builder: (context, value, child) =>  Row(
                              children: [
                                Expanded(
                                  child: textWithHeadder(
                                    context,
                                    "Treatment Time",
                                    CommonTextFormField(
                                      onTap: () async{
                                          final pickedTime = await pickTime(context, initialTime: timeController.value);
                                  if (pickedTime != null) {
                                      timeController.value = pickedTime;
                                  }
                                      },
                                      isReadonly: true,
                                      controller: timeController.value == null? TextEditingController() : TextEditingController(text: timeController.value!.hour.toString().padLeft(2, '0')),
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
                                  child: textWithHeadder(
                                    context,
                                    "",
                                    CommonTextFormField(
                                      onTap: () async{
                                          final pickedTime = await pickTime(context, initialTime: timeController.value);
                                  if (pickedTime != null) {
                                      timeController.value = pickedTime;
                                  }
                                      },
                                      isReadonly: true,
                                      controller:  timeController.value == null? TextEditingController() : TextEditingController(text: timeController.value!.minute.toString().padLeft(2, '0')),
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
                        ),
                        SizedBox(height: 20.sdp),

                        CommonButton(
                          buttoncolor: ColorResources.loginButtonGreen,
                          onTap: () {
                           context.read<RegisterClickBlocBloc>().add(
                          RegisterClickedEvent(
                            data: { "name": nameController.text,             
  "excecutive": "",        
  "payment": _selectedPayment.value,          
  "phone": whatsupController.text,             
  "address": addressController.text,           
  "total_amount": double.tryParse(amountController.text),    
  "discount_amount": double.tryParse(discountController.text), 
  "advance_amount": double.tryParse(adwanceController.text),   
  "balance_amount": double.tryParse(balanceController.text),   
  "id": "",          
  "male": getMaleTreatmentIds(addedTreatments.value), 
  "female": getfemaleTreatmentIds(addedTreatments.value),            
  "branch": "166",            
  "treatments": "100,86",  }  
                          ),
                        );
                          },
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


  //paym,ent row
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

}



  class AddedTreatmentModel{
    final Treatment treatment;
    final int maleCount;
    final int femaleCount;

  AddedTreatmentModel({required this.treatment, required this.maleCount, required this.femaleCount});
  }


  //get male ids
String getMaleTreatmentIds(List<AddedTreatmentModel> treatments) {
  return treatments
      .where((t) => t.maleCount > 0) 
      .map((t) => t.treatment.id.toString()) 
      .join(','); }

  //get female ids
String getfemaleTreatmentIds(List<AddedTreatmentModel> treatments) {
  return treatments
      .where((t) => t.femaleCount > 0) 
      .map((t) => t.treatment.id.toString()) 
      .join(','); }