import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
class StoreModel with _$StoreModel {
  const factory StoreModel({
    required int totalDataCount,
    required List<Datum> data,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    required String name,
    required String address,
    required City city,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String id,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    required String name,
    required String id,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
