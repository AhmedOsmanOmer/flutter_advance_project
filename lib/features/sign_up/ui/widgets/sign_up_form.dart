import 'package:flutter/material.dart';
import 'package:flutter_advance/core/helpers/app_regex.dart';
import 'package:flutter_advance/core/theming/spacing.dart';
import 'package:flutter_advance/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter_advance/features/sign_up/ui/widgets/phone_number_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignUpCubit>().nameController,
          ),
          verticalSpace(18),
          PhoneNubmerField(
            validator: (val) {
              if (!val!.isValidNumber()) {
                return "Invalid phone number";
              }
              return "";
            },
          ),
          /*AppTextFormField(
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignUpCubit>().phoneController,
          )*/
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignUpCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
              controller: context.read<SignUpCubit>().passwordController,
              hintText: 'Password',
              isObscureText: isPasswordObscureText,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isPasswordObscureText = !isPasswordObscureText;
                  });
                },
                child: Icon(
                  isPasswordObscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
                if (context.read<SignUpCubit>().passwordController.text !=
                    context
                        .read<SignUpCubit>()
                        .passwordConfirmController
                        .text) {
                  return 'Password  and confirmation do not match';
                }
                if (context.read<SignUpCubit>().passwordController.text.length <
                    6) {
                  return "Password should be at least 6 characters long";
                }
              }),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordConfirmController,
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              if (context.read<SignUpCubit>().passwordController.text !=
                  context.read<SignUpCubit>().passwordConfirmController.text) {
                return 'Password  and confirmation do not match';
              }
              if (context.read<SignUpCubit>().passwordController.text.length <
                  6) {
                return "Password should be at least 6 characters long";
              }
            },
          ),
        ],
      ),
    );
  }
}
