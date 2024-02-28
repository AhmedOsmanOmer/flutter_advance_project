import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_advance/core/theming/colors.dart';
import 'package:flutter_advance/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

// ignore: must_be_immutable
class PhoneNubmerField extends StatelessWidget {
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  TextEditingController? controller;

  PhoneNubmerField({super.key, required this.validator, this.controller});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.mainBlue,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManager.lighterGray,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: TextStyles.font14LightGrayRegular,
        hintText: "Phone Number",
        fillColor: ColorsManager.moreLightGray,
        filled: true,
      ),
      initialCountryCode: 'AE',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
