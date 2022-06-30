// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firm_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirmModel _$FirmModelFromJson(Map<String, dynamic> json) => FirmModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FirmModelToJson(FirmModel instance) => <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      firm: json['firm'] as String?,
      subdomain: json['subdomain'] as String?,
      active: json['active'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'firm': instance.firm,
      'subdomain': instance.subdomain,
      'active': instance.active,
    };
