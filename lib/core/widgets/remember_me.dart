import 'package:flutter/material.dart';
import 'package:flutter_advance/core/theming/colors.dart';
import 'package:flutter_advance/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({super.key});

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool isChecked = false;

  void onChanged(bool? value) {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(          
          value: isChecked,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: ColorsManager.mainBlue,
        ),
        Text(
          "Remember Me",
          style: TextStyles.font13GrayRegular,
        ),
         SizedBox(
          width: 70.w,
        ),
        Text(
          "Forgot Pasword",
          style: TextStyles.font13BlueRegular,
        )
      ],
    );
  }
}
