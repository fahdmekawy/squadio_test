import 'package:json_annotation/json_annotation.dart';

part 'people_model.g.dart';

@JsonSerializable()
class PeopleModel {
  Data? data;
  String? message;

  PeopleModel({this.data, this.message});

  factory PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleModelFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleModelToJson(this);
}

@JsonSerializable()
class Data {
  List<Result>? result;
  Pagination? pagination;

  Data({this.result, this.pagination});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Result {
  int? id;
  String? name;
  String? email;
  String? phone_number;

  Result({this.id, this.name, this.email, this.phone_number});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Pagination {
  int? total;
  int? count;
  int? per_page;
  int? current_page;
  int? total_pages;

  Pagination(
      {this.total,
      this.count,
      this.per_page,
      this.current_page,
      this.total_pages});

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
