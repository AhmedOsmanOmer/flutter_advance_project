import 'package:dio/dio.dart';
import 'package:flutter_advance/core/networking/api_constants.dart';
import 'package:flutter_advance/features/login/data/models/login_request_body.dart';
import 'package:flutter_advance/features/login/data/models/login_response.dart';
import 'package:flutter_advance/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

   @POST(ApiConstants.signup)
  Future<LoginResponse> signup(
    @Body() SignUpRequestBody signUpRequestBody,
  );
}
