// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleModel _$PeopleModelFromJson(Map<String, dynamic> json) => PeopleModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PeopleModelToJson(PeopleModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'result': instance.result,
      'pagination': instance.pagination,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone_number: json['phone_number'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phone_number,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      total: json['total'] as int?,
      count: json['count'] as int?,
      per_page: json['per_page'] as int?,
      current_page: json['current_page'] as int?,
      total_pages: json['total_pages'] as int?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total': instance.total,
      'count': instance.count,
      'per_page': instance.per_page,
      'current_page': instance.current_page,
      'total_pages': instance.total_pages,
    };
