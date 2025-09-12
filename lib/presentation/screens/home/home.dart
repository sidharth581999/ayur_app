import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/status_bar_styler.dart';
import 'package:ayur/presentation/widgets/common_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StatusBarStyler(backgroundColor: ColorResources.white,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
              backgroundColor: context.dynamicColor(
                        light: ColorResources.white,
                        dark: ColorResources.white,
                      ),
              actions: [Padding(
                padding: EdgeInsets.only(right: 20.sdp),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(AppAssets.notificationEnabled, height: 22.sdp,)),
                ),
              ),],
              
            ),
        body: Padding(
          padding: EdgeInsets.all(20.sdp),
          child: Column(
            children: [
              Row(
                children: [
                  CommonTextFormField(controller: TextEditingController(), hintText: "Enter your email"),
                  
                ],
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}