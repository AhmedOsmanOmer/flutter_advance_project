import 'package:flutter/material.dart';
import 'package:flutter_advance/core/di/dependency_injection.dart';
import 'package:flutter_advance/core/routing/routes.dart';
import 'package:flutter_advance/features/home_Screen.dart/ui/home_screen.dart';
import 'package:flutter_advance/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advance/features/login/ui/login_screen.dart';
import 'package:flutter_advance/features/onboarding/onboarding_screen.dart';
import 'package:flutter_advance/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter_advance/features/sign_up/ui/sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) =>  BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
         case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("No Rotue found for this settings"),
                  ),
                ));
    }
  }
}
