import 'package:flutter_advance/core/networking/api_errors_handler.dart';
import 'package:flutter_advance/core/networking/api_result.dart';
import 'package:flutter_advance/core/networking/api_services.dart';
import 'package:flutter_advance/features/login/data/models/login_response.dart';
import 'package:flutter_advance/features/sign_up/data/models/sign_up_request_body.dart';

class SignUpRepo {
  final ApiServices _apiServices;

  SignUpRepo(this._apiServices);

  Future<ApiResult<LoginResponse>> login(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiServices.signup(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
