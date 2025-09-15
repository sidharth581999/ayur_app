import 'dart:ui';

import 'package:ayur/application/core/route/app_route.dart';
import 'package:ayur/application/core/theme/colors.dart';
import 'package:ayur/application/core/utils/app_assets.dart';
import 'package:ayur/application/core/utils/extentions.dart';
import 'package:ayur/data/storage/login_data.dart';
import 'package:ayur/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

      WidgetsBinding.instance.addPostFrameCallback((_) {
    loginCheck();
  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.splashBg,), fit: BoxFit.cover)
        ),
        child:  ClipRRect(
              borderRadius: BorderRadius.circular(16), // match with container
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: ColorResources.black.withOpacity(0.3), 
                  
                  child: Center(child: SvgPicture.asset(AppAssets.logoBig, height: 100.sdp,),),
                ),
              ),
      ),
          ));
  }

  loginCheck() async{
    // LoginDataStore.clearLogin();
    final res = await LoginDataStore.getLogin();
    if (res != null && res.token != null) {
      context.read<HomeBloc>().add(
                          HomeBuildEvent()
                        );
      Navigator.pushReplacementNamed(context, AppRoute.home);
    } else{
      Navigator.pushReplacementNamed(context, AppRoute.login);
    }
  }
}