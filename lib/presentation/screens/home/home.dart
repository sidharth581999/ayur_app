import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/status_bar_styler.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/presentation/widgets/common_button.dart';
import 'package:ayur/presentation/widgets/common_textformfield.dart';
import 'package:ayur/presentation/widgets/underline.dart';
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
        body: Column(
          children: [
            SizedBox(height: 16.sdp,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sdp),
              child: Row(
                children: [
                  Expanded(child: CommonTextFormField(
                    prefix: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.search, height: 18.sdp,),
                      ],
                    ),
                    hintStyle: TextStyle(fontSize: 12.sdp, fontWeight: FontWeight.w400, color: ColorResources.greyText),
                    height: 40,
                    controller: TextEditingController(), hintText: "Search for treatments")),
                      
                    SizedBox(width: 13.sdp,),
                    CommonButton(buttoncolor: ColorResources.loginButtonGreen, onTap: (){}, height: 40.sdp, borderRadious: 8.5,
                    width: null,
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 15.sdp),
                     child: Center(child: TextWidget(
                              text: "Search",
                              style: TextStyle(
                      fontSize: 12.sdp, fontWeight: FontWeight.w500),
                              textColor: context.dynamicColor(
                                    light: ColorResources.white,
                                    dark: ColorResources.white,
                              ),
                            ), ),),
                ],
              ),
            ),
            SizedBox(height: 20.sdp,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sdp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                              text: "Sort by :",
                              style: TextStyle(
                      fontSize: 16.sdp, fontWeight: FontWeight.w500),
                              textColor: context.dynamicColor(
                                    light: ColorResources.black,
                                    dark: ColorResources.black,
                              ),
                            ),
                      
                  Container(
                    height: 40.sdp,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorResources.greyBorder
                      ),
                      borderRadius: BorderRadius.circular(33.sdp)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal:  10.sdp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                                    text: "05-08-2025",
                                    style: TextStyle(
                            fontSize: 15.sdp, fontWeight: FontWeight.w400),
                                    textColor: context.dynamicColor(
                                          light: ColorResources.lightBlacktext,
                                          dark: ColorResources.lightBlacktext,
                                    ),
                                  ),
                          SizedBox(width: 8.sdp,),
                          Icon(Icons.keyboard_arrow_down, color: ColorResources.lightBlacktext,)
                          
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 13.sdp,),
            UnderLine(height: 1, color: null),
            SizedBox(height: 13.sdp,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.sdp),
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => AnimatedContainer(duration: Duration(microseconds: 400),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(10.sdp),
                    color: ColorResources.greyContainer
                  ),
                  child: Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                                  text: "1.",
                                                  style: TextStyle(
                                          fontSize: 18.sdp, fontWeight: FontWeight.w500),
                                                  textColor: context.dynamicColor(
                                                        light: ColorResources.black,
                                                        dark: ColorResources.black,
                                                  ),
                                                ),
                                                SizedBox(width: 10.sdp,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                                    text: "Sidharth",
                                                    style: TextStyle(
                                            fontSize: 18.sdp, fontWeight: FontWeight.w500),
                                                    textColor: context.dynamicColor(
                                                          light: ColorResources.black,
                                                          dark: ColorResources.black,
                                                    ),
                                                  ),
                                                
                                      TextWidget(
                                        maxLines: 1,
                                                    text: "Couple Combo Package (Rejuvent and mitsopicatiom",
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                            fontSize: 16.sdp, fontWeight: FontWeight.w300),
                                                    textColor: context.dynamicColor(
                                                          light: ColorResources.lightGreenText,
                                                          dark: ColorResources.lightGreenText,
                                                    ),
                                                  ),
                                      SizedBox(height: 15.sdp,),
                                      Row(
                                        children: [
                                          Row(
                                        children: [
                                          SvgPicture.asset(AppAssets.calander, height: 15.sdp,),
                                          SizedBox(width: 4.sdp,),
                                          TextWidget(
                                        maxLines: 1,
                                                    text: "31/09/2025",
                                                    style: TextStyle(
                                            fontSize: 15.sdp, fontWeight: FontWeight.w400),
                                                    textColor: context.dynamicColor(
                                                          light: ColorResources.lightBlacktext,
                                                          dark: ColorResources.lightBlacktext,
                                                    ),
                                                  ),
                                        ],
                                      ),
                                      SizedBox(width: 15.sdp,),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(AppAssets.person2, height: 15.sdp,),
                                            SizedBox(width: 4.sdp,),
                                            Expanded(
                                              child: TextWidget(
                                                overflow: TextOverflow.ellipsis,
                                                                            maxLines: 1,
                                                        text: "Sihrayu uygdiwedih cdiuhsbidcuh",
                                                        style: TextStyle(
                                                fontSize: 15.sdp, fontWeight: FontWeight.w400),
                                                        textColor: context.dynamicColor(
                                                              light: ColorResources.lightBlacktext,
                                                              dark: ColorResources.lightBlacktext,
                                                        ),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                        ],
                                      )
                                      
                                      
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 12.sdp,),
                          UnderLine(height: 1, color: null),
                          SizedBox(height: 12.sdp,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Row(
                                 children: [
                                   SizedBox(width: 10.sdp,),
                                    TextWidget(
                                                        text: "1.",
                                                        style: TextStyle(
                                                fontSize: 18.sdp, fontWeight: FontWeight.w500),
                                                        textColor: context.dynamicColor(
                                                              light: ColorResources.greyContainer,
                                                              dark: ColorResources.greyContainer,
                                                        ),
                                                      ),
                                    TextWidget(
                                                          text: "View Booking details",
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                  fontSize: 16.sdp, fontWeight: FontWeight.w300),
                                                          textColor: context.dynamicColor(
                                                                light: ColorResources.black,
                                                                dark: ColorResources.black,
                                                          ),
                                                        ),
                                 ],
                               ),
                  
                               Icon(Icons.arrow_forward_ios_rounded, color: ColorResources.lightGreenText,)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ),),
                  SizedBox(height: 12.sdp,),
                  CommonButton(buttoncolor: ColorResources.loginButtonGreen, onTap: (){}, height: 50.sdp, width: double.maxFinite, borderRadious: 8.5, child: Center(child: TextWidget(
                            text: "Register Now",
                            style: TextStyle(
                    fontSize: 17.sdp, fontWeight: FontWeight.w600),
                            textColor: context.dynamicColor(
                                  light: ColorResources.white,
                                  dark: ColorResources.white,
                            ),
                          ), ),),
                ],
              ),
            )
            
          ],
        ),
      ),
      ),
    );
  }
}