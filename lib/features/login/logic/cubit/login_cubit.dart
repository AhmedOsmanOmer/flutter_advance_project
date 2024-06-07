import 'package:flutter/material.dart';
import 'package:flutter_advance/features/login/data/models/login_request_body.dart';
import 'package:flutter_advance/features/login/data/repo/login_repo.dart';
import 'package:flutter_advance/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) {
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorsModel.message ?? ''));
    });
  }

  phone_val()async{
  await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '+971582857929',
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {},
  codeAutoRetrievalTimeout: (String verificationId) {},
);
  }
}