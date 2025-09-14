import 'package:ayur/application/core/route/app_route.dart';
import 'package:ayur/application/core/utils/toast.dart';
import 'package:ayur/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:ayur/presentation/bloc/loginBloc/login_bloc.dart';
import 'package:ayur/presentation/screens/login/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginClickedState) {
              if (state.isError) {
                HelperService.showCustomToast(message: state.errorMsg??"",type: "error");
              } else if(state.isSuccess) {
                HelperService.showCustomToast(message: "Successfully Logedin");
                context.read<HomeBloc>().add(
                          HomeBuildEvent()
                        );
                Navigator.pushReplacementNamed(context, AppRoute.home);
              }         
            }
          },
          child: Column(
            children: [
              ImageSection(),
              FormSection(
                emailController: emailController,
                passwordController: passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
