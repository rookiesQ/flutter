// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Autogenerated _$AutogeneratedFromJson(Map<String, dynamic> json) {
  return Autogenerated(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      code: json['code'] as int);
}

Map<String, dynamic> _$AutogeneratedToJson(Autogenerated instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'code': instance.code
    };