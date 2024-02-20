import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advance/core/helpers/extentios.dart';
import 'package:flutter_advance/core/routing/routes.dart';
import 'package:flutter_advance/core/theming/colors.dart';
import 'package:flutter_advance/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.pushNamed(Routes.loginScreen);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 52.h)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
        child: Text(
          "Get Started",
          style: TextStyles.font16WhiteMedium,
        ));
  }
}
