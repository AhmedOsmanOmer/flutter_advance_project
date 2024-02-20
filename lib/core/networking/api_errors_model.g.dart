// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_errors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorsModel _$ApiErrorsModelFromJson(Map<String, dynamic> json) =>
    ApiErrorsModel(
      message: json['message'] as String,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$ApiErrorsModelToJson(ApiErrorsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
