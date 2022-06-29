import 'package:json_annotation/json_annotation.dart';

part 'firm_model.g.dart';

@JsonSerializable()
class FirmModel {
  List<Data>? data;
  String? message;

  FirmModel({this.data, this.message});

  factory FirmModel.fromJson(Map<String, dynamic> json) =>
      _$FirmModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirmModelToJson(this);
}


@JsonSerializable()
class Data {
  String? firm;
  String? subdomain;
  int? active;

  Data({this.firm, this.subdomain, this.active});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
