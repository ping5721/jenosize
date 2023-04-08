import 'package:freezed_annotation/freezed_annotation.dart';
part 'restuarant.freezed.dart';
part 'restuarant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    required String id,
    required String name,
    required String imageProfile,
    required String imageCover,
    required String address,
    required double latitude,
    required double longitude,
    required String description,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}
