import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/dashed_underline.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/status_bar_styler.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:ayur/presentation/bloc/pdfBloc/pdf_bloc.dart';
import 'package:ayur/presentation/widgets/underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StatusBarStyler(
        backgroundColor: ColorResources.white,
        child: Scaffold(
          backgroundColor: Colors.white, // invoice-style background
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: context.dynamicColor(
              light: ColorResources.white,
              dark: ColorResources.white,
            ),
            title: TextWidget(text: "Invoice", style: TextStyle(fontSize: 17.sdp, fontWeight: FontWeight.w600),),
            actions: [],
          ),
          body: 
          BlocBuilder<PdfBloc, PdfState>(
            builder: (context, state) {
              if (state is PdfBuildState) {
                return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.sdp),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80.sdp,
                            width: 80.sdp,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage(AppAssets.logoPng))
                            ),                 
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextWidget(text:  "KUMARAKOM",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600, fontSize: 10.sdp)),
                                SizedBox(height: 2.sdp),
                                TextWidget(text:  "Cheepunkal P.O. Kottayam, Kerala - 686563", style: TextStyle(
                                  color: ColorResources.greyDarkText,
                                        fontWeight: FontWeight.w600, fontSize: 10.sdp)),
                                TextWidget(text:  "Email: unknown@gmail.com", style: TextStyle(
                                  color: ColorResources.greyDarkText,
                                        fontWeight: FontWeight.w600, fontSize: 10.sdp)),
                                TextWidget(text: "Mob: +91 9876543210", style: TextStyle(
                                  color: ColorResources.greyDarkText,
                                        fontWeight: FontWeight.w600, fontSize: 10.sdp)),
                                TextWidget(text: "GST No: 32AABCU9603R1ZW", style: TextStyle(
                                        fontWeight: FontWeight.w500, fontSize: 10.sdp)),
                              ],
                            ),
                          ),
                        ],
                      ),
                     SizedBox(height: 18.sdp),
                     DottedLine(color: ColorResources.greyBorder,),
                          SizedBox(height: 18.sdp),
                      // Patient details
                      TextWidget(text:  "Patient Details",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: ColorResources.lightGreenText2)),
                      SizedBox(height: 5.sdp),
                      TextRow(label1: 'Name', value1: state.name, label2: 'Booked On', value2: getCurrentDateTime(),),
                      SizedBox(height: 5.sdp),
                      TextRow(label1: 'Address', value1: state.address, label2: 'Treatment Date', value2: state.dateTime.substring(0,10),),
                          SizedBox(height: 5.sdp),
                      TextRow(label1: 'Whatsup Number', value1: '88976878', label2: 'Treatment Time', value2: state.dateTime.substring(10,16),),
                           SizedBox(height: 18.sdp),
                     UnderLine(color: ColorResources.greyBorder, height: 1,),
                      SizedBox(height: 18.sdp),
                      Table(
                        // border: TableBorder.symmetric(
                        //     inside: BorderSide(color: Colors.grey.shade300)),
                        columnWidths: const {
                          0: FlexColumnWidth(3.5),
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(1),
                          3: FlexColumnWidth(1.5),
                          4: FlexColumnWidth(2),
                        },
                        children: [
                           TableRow(
                            children: [
                              TextWidget(text:  "Treatment",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sdp, color: ColorResources.lightGreenText2)),
                              TextWidget(text: "Price",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sdp, color: ColorResources.lightGreenText2)),
                              Padding(
                                padding: EdgeInsets.only(right: 5.0.sdp),
                                child: TextWidget(text: "Male",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sdp, color: ColorResources.lightGreenText2)),
                              ),
                              
                              Padding(
                               padding: EdgeInsets.only(right: 5.0.sdp),
                                child: TextWidget(text: "Female",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sdp, color: ColorResources.lightGreenText2)),
                              ),
                              TextWidget(text: "Total",
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sdp, color: ColorResources.lightGreenText2)),
                            ],
                          ),
                          _buildRow("", "", "", "", ""),
                          for(final item in state.treatments)
                          _buildRow(item.treatment.name??"", "₹230", "${item.maleCount}", "${item.femaleCount}", "₹2,540"),
                        ],
                      ),
                          
                     SizedBox(height: 18.sdp),
                      DottedLine(color: ColorResources.greyBorder,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: SizedBox(
                                    width: 100.sdp,
                                    child: TextWidget(text: "Total Amount", style:  TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sdp, color: ColorResources.black),),
                                  ),
                                ),
                                                 TextWidget(text: "₹${state.amount}", style:  TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sdp, color: ColorResources.black),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: SizedBox(
                                    width: 100.sdp,
                                    child: TextWidget(text: "Dizcount", style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black),),
                                  ),
                                ),
                                                 TextWidget(text: "₹${state.discount}", style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: SizedBox(
                                    width: 100.sdp,
                                    child: TextWidget(text: "Advance", style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black),),
                                  ),
                                ),
                                                 TextWidget(text: "₹${state.adwance}", style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black),),
                              ],
                            ),
                            SizedBox(height: 4.sdp),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                 DottedLine(
                                  length: 200.sdp,
                                  color: ColorResources.greyBorder,),
                               ],
                             ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  child: SizedBox(
                                    width: 100.sdp,
                                    child: TextWidget(text: "Balance", style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black),),
                                  ),
                                ),
                                                 TextWidget(text: "₹${state.balance}", style:  TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                          
                      SizedBox(height: 30.sdp),
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextWidget(text: 
                              "Thank you for choosing us",
                              style: TextStyle(
                                  fontSize: 16.sdp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorResources.lightGreenText2),
                            ),
                            SizedBox(height: 10.sdp),
                            TextWidget(text: 
                              "Your well-being is our commitment, and we're honored\n"
                              "you've entrusted us with your health journey",
                              textAlign: TextAlign.end,
                              style: TextStyle(color: ColorResources.greyDarkText, fontSize: 10.sdp, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                ),
                DottedLine(color: ColorResources.greyBorder,),
                SizedBox(height: 5.sdp,),
                Text(
                        "Booking amount is non-refundable, and it's important to arrive on the allotted time for your treatment",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: ColorResources.greyDarkText, fontSize: 10.sdp, fontWeight: FontWeight.w400),
                      ),
              ],
            ),
          );
              } else{
                return SizedBox();
              }
          }),
        ),
      ),
    );
  }

  static TableRow _buildRow(
      String treatment, String price, String male, String female, String total) {
    return TableRow(
      children: [
        TextWidget(text: treatment,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black)),
        TextWidget(text: price,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black)),
                        TextWidget(text: male,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black)),
                        TextWidget(text: female,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black)),
                        TextWidget(text: total,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sdp, color: ColorResources.black)),
      ],
    );
  }
}

class TextRow extends StatelessWidget {
  final String label1;
  final String value1;
  final String label2;
  final String value2;
  const TextRow({
    super.key, required this.label1, required this.value1, required this.label2, required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextWidget(text: "$label1: ", style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: ColorResources.black),),
            TextWidget(text: value1,
            style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: ColorResources.greyDarkText)),
            ],
        ),
        Row(
          children: [
            TextWidget(text: "$label2: ", style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: ColorResources.black),),
            TextWidget(text: value2,
            style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: ColorResources.greyDarkText)),
            ],
        ),
      ],
    );
  }
}


String getCurrentDateTime() {
  final now = DateTime.now();
  final formatter = DateFormat('dd-MM-yyyy | hh:mm a');
  return formatter.format(now);
}
