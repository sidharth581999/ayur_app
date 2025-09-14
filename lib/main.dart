import 'package:ayur/application/core/route/app_route.dart';
import 'package:ayur/application/core/theme/app_theme.dart';
import 'package:ayur/application/core/utils/device_size.dart';
import 'package:ayur/application/core/utils/enums.dart';
import 'package:ayur/application/core/utils/toast.dart';
import 'package:ayur/presentation/bloc/homeBloc/home_bloc.dart';
import 'package:ayur/presentation/bloc/loginBloc/login_bloc.dart';
import 'package:ayur/presentation/bloc/registerClickBloc/register_click_bloc_bloc.dart';
import 'package:ayur/presentation/bloc/registerbuildBloc/register_bloc.dart';
import 'package:ayur/presentation/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DeviceSize.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),

        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (_) => RegisterBloc(),
        ),
        BlocProvider<RegisterClickBlocBloc>(
          create: (_) => RegisterClickBlocBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: HelperService.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Fliq',
            onGenerateRoute: AppRoute.onGenerateRoute,
            initialRoute: AppRoute.splash,
            theme: AppTheme.getTheme(AppThemeMode.light),
            // builder: (context, child) => Stack(
            //   children: [
            //     child!,
            //     const DropdownAlert(),
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
