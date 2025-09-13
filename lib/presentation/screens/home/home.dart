import 'package:ayur/application/core/route/app_route.dart';
import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/application/core/utils/status_bar_styler.dart';
import 'package:ayur/application/core/utils/text_widget.dart';
import 'package:ayur/data/models/patient_model.dart';
import 'package:ayur/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:ayur/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:ayur/presentation/screens/home/widgets/home_widgets.dart';
import 'package:ayur/presentation/widgets/common_button.dart';
import 'package:ayur/presentation/widgets/common_textformfield.dart';
import 'package:ayur/presentation/widgets/error_widget.dart';
import 'package:ayur/presentation/widgets/shimmer_loading.dart';
import 'package:ayur/presentation/widgets/underline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeBuildState) {
                return
                state.isLoading? ListView.builder(
                  shrinkWrap: true,
  itemCount: 3,
  itemBuilder: (_, __) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
    child: Row(
      children: [
        const ShimmerLoader.circular(size: 48),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ShimmerLoader.rectangular(width: double.infinity, height: 16),
              SizedBox(height: 8),
              ShimmerLoader.rectangular(width: 150, height: 14),
            ],
          ),
        ),
      ],
    ),
  ),
) : 
state.isError? ErrorMessage(message: state.errorMsg??"", height:  double.maxFinite, width: double.maxFinite,) :
Column(
                children: [
                  SizedBox(height: 16.sdp),
                  SearchWidget(),
                  SizedBox(height: 20.sdp),
                  SortWidget(),
                  SizedBox(height: 13.sdp),
                  UnderLine(height: 1, color: null),
                  SizedBox(height: 13.sdp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sdp),
                    child: Column(
                      children: [
                        state.patients?.patient != null? 
                        ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => PatientTile(patient: state.patients!.patient![index], index: index+1,) 
                        ) : ErrorMessage(message: state.errorMsg??"", height:  double.maxFinite, width: double.maxFinite,),
                        SizedBox(height: 12.sdp),
                        CommonButton(
                          buttoncolor: ColorResources.loginButtonGreen,
                          onTap: () {
                            context.read<RegisterBloc>().add(
                          RegisterBuildEvent()
                        );
                            Navigator.pushNamed(context, AppRoute.register);
                          },
                          height: 50.sdp,
                          width: double.maxFinite,
                          borderRadious: 8.5,
                          child: Center(
                            child: TextWidget(
                              text: "Register Now",
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
                ],
              );
              } else{
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
