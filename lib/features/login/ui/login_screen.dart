import 'package:flutter/material.dart';
import 'package:flutter_advance/core/theming/spacing.dart';
import 'package:flutter_advance/core/theming/styles.dart';
import 'package:flutter_advance/core/widgets/app_text_button.dart';
import 'package:flutter_advance/core/widgets/remember_me.dart';
import 'package:flutter_advance/core/widgets/social_media_authentication_buttons.dart';
import 'package:flutter_advance/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advance/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:flutter_advance/features/login/ui/widgets/email_and_password.dart';
import 'package:flutter_advance/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter_advance/features/login/ui/widgets/terms_and_conditions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    print("????????????????????????????????????????????????????????");
    context.read<LoginCubit>().phone_val();
    super.initState();
  }

  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular),
              verticalSpace(36),
              Column(
                children: [
                  const EmailAndPassword(),
                  verticalSpace(24),
                  const RememberMe(),
                  verticalSpace(40),
                  AppTextButton(
                    buttonText: "Login",
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      validateThenDoLogin(context);
                    },
                  ),
                  verticalSpace(50),
                  const Text("Or Sign in with"),
                  verticalSpace(20),
                  const SocialMediaButton(),
                  verticalSpace(30),
                  const TermsAndConditionsText(),
                  verticalSpace(40),
                  const DontHaveAccountText(),
                  const LoginBlocListener(),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
