import 'package:flutter/material.dart';
import 'package:flutter_advance/core/di/dependency_injection.dart';
import 'package:flutter_advance/core/routing/routes.dart';
import 'package:flutter_advance/features/home_Screen.dart/ui/home_screen.dart';
import 'package:flutter_advance/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advance/features/login/ui/login_screen.dart';
import 'package:flutter_advance/features/onboarding/onboarding_screen.dart';
import 'package:flutter_advance/features/sign_up/ui/sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      default:
        return null;
    }
  }
}
