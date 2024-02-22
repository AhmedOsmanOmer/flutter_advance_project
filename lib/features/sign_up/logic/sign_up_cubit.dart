import 'package:flutter/material.dart';
import 'package:flutter_advance/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:flutter_advance/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:flutter_advance/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {
    emit(const SignUpState.signupLoading());
    final response = await _signUpRepo.login(
      SignUpRequestBody(
        email: emailController.text,
        password: passwordController.text,
        gender: 0,
        name: nameController.text,
        passwordConfirmation: passwordConfirmController.text,
        phone: phoneController.text
      ),
    );
    response.when(success: (signUpResponse) {
      emit(SignUpState.signupSuccess(signUpResponse));
    }, failure: (error) {
      emit(SignUpState.signupError(error: error.apiErrorsModel.message ?? ''));
    });
  }
}
