import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_errors_model.g.dart';

@JsonSerializable()
class ApiErrorsModel {
  final String message;
  final int? code;
  ApiErrorsModel({
    required this.message,
     this.code,
  });

  factory ApiErrorsModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorsModelToJson(this);
}
