import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String name;
  final String email;
  final String password;
  final String phone;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final int gender;

  SignUpRequestBody(
      {required this.email,
      required this.password,
      required this.gender,
      required this.name,
      required this.passwordConfirmation,
      required this.phone});

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
