import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:ayur/presentation/widgets/common_button.dart';
import 'package:ayur/presentation/widgets/common_textformfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mediaQuerySize.height * 0.75,
      child: Padding(
        padding: EdgeInsetsGeometry.all(20.sdp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.sdp),
                TextWidget(
                  text: "Login or register to book your appointments",
                  style: TextStyle(
                    fontSize: 24.sdp,
                    fontWeight: FontWeight.w600,
                  ),
                  textColor: context.dynamicColor(
                    light: ColorResources.black,
                    dark: ColorResources.black,
                  ),
                ),
                SizedBox(height: 30.sdp),
                TextWidget(
                  text: "Email",
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
                CommonTextFormField(
                  controller: emailController,
                  hintText: "Enter your email",
                ),
                SizedBox(height: 16.sdp),
                TextWidget(
                  text: "Password",
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
                CommonTextFormField(
                  controller: passwordController,
                  hintText: "Enter your password",
                ),
                SizedBox(height: 80.sdp),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return CommonButton(
                      buttoncolor: ColorResources.loginButtonGreen,
                      onTap: () {
                        if (state is LoginClickedState && state.isLoading) {
                          
                        } else{
                          context.read<LoginBloc>().add(
                          LoginClickedEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                        }   
                      },
                      height: 50.sdp,
                      width: double.maxFinite,
                      borderRadious: 8.5,
                      child: Center(
                        child: state is LoginClickedState && state.isLoading? CircularProgressIndicator() : TextWidget(
                          text: "Login",
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
                    );
                  },
                ),
              ],
            ),

            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    "By creating or logging into an account you are agreeing with our ",
                style: TextStyle(
                  color: ColorResources.black,
                  fontSize: 12.sdp,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: "Terms and Conditions",
                    style: TextStyle(
                      color: ColorResources.textBlue,
                      fontSize: 12.sdp,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                    text: " and ",
                    style: TextStyle(
                      color: ColorResources.black,
                      fontSize: 12.sdp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      color: ColorResources.textBlue,
                      fontSize: 12.sdp,
                      fontWeight: FontWeight.w500,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                    text: ".",
                    style: TextStyle(
                      color: ColorResources.black,
                      fontSize: 12.sdp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // TextWidget(
            //   text: "By creating or logging into an account you are agreeing with our Terms and Conditions and Privacy Policy.",
            // )
          ],
        ),
      ),
    );
  }
}

//image section
class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      height: context.mediaQuerySize.height * 0.25,
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.loginBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(child: SvgPicture.asset(AppAssets.logoBig, height: 60.sdp)),
    );
  }
}
