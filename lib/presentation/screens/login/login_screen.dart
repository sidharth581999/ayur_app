import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/presentation/widgets/common_button.dart';
import 'package:ayur/presentation/widgets/common_textformfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedContainer(duration: Duration(microseconds: 300),
          height: context.mediaQuerySize.width * 0.55,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.loginBg), fit: BoxFit.cover)
          ),
          child: Center(
            child: SvgPicture.asset(AppAssets.logoBig, height: 60.sdp,),
          ),
          ),

          //Login or register to book your appointments
          Expanded(
            child: Padding(padding: EdgeInsetsGeometry.all(20.sdp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.sdp,),
                      TextWidget(
                              text: "Login or register to book your appointments",
                              style: TextStyle(
                      fontSize: 24.sdp, fontWeight: FontWeight.w600),
                              textColor: context.dynamicColor(
                                    light: ColorResources.black,
                                    dark: ColorResources.black,
                              ),
                            ),
                      SizedBox(height: 30.sdp,),
                      TextWidget(
                              text: "Email",
                              style: TextStyle(
                      fontSize: 16.sdp, fontWeight: FontWeight.w400),
                              textColor: context.dynamicColor(
                                    light: ColorResources.black,
                                    dark: ColorResources.black,
                              ),
                            ),
                      SizedBox(height: 5.sdp,),
                      CommonTextFormField(controller: emailController, hintText: "Enter your email"),
                      SizedBox(height: 16.sdp,),
                      TextWidget(
                              text: "Password",
                              style: TextStyle(
                      fontSize: 16.sdp, fontWeight: FontWeight.w400),
                              textColor: context.dynamicColor(
                                    light: ColorResources.black,
                                    dark: ColorResources.black,
                              ),
                            ),
                      SizedBox(height: 5.sdp,),
                      CommonTextFormField(controller: emailController, hintText: "Enter your password"),
                      SizedBox(height: 80.sdp,),
                      CommonButton(buttoncolor: ColorResources.loginButtonGreen, onTap: (){}, height: 50.sdp, width: double.maxFinite, borderRadious: 8.5, child: Center(child: TextWidget(
                              text: "Login",
                              style: TextStyle(
                      fontSize: 17.sdp, fontWeight: FontWeight.w600),
                              textColor: context.dynamicColor(
                                    light: ColorResources.white,
                                    dark: ColorResources.white,
                              ),
                            ), ),),
                    ],
                  ),
            
                  RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By creating or logging into an account you are agreeing with our ",
                    style:  TextStyle(color: ColorResources.black, fontSize: 12.sdp, fontWeight: FontWeight.w400 ),
                    children: [
            TextSpan(
              text: "Terms and Conditions",
              style:  TextStyle(color: ColorResources.textBlue, fontSize: 12.sdp, fontWeight: FontWeight.w500 ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                },
            ),
            TextSpan(
              text: " and ",
              style: TextStyle(color: ColorResources.black, fontSize: 12.sdp, fontWeight: FontWeight.w400 ),
            ),
            TextSpan(
              text: "Privacy Policy",
              style: TextStyle(color: ColorResources.textBlue, fontSize: 12.sdp, fontWeight: FontWeight.w500 ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                },
            ),
            TextSpan(
              text: ".",
              style: TextStyle(color: ColorResources.black, fontSize: 12.sdp, fontWeight: FontWeight.w400 ),
            ),
                    ],
                  ))
                  // TextWidget(
                  //   text: "By creating or logging into an account you are agreeing with our Terms and Conditions and Privacy Policy.",
                  // )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}