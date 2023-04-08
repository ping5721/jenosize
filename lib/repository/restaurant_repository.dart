import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jenosize/constants/storage_keys.dart';
import 'package:jenosize/model/restuarant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IRestaurantRepository {
  Future<List<Restaurant>> getList({String? search});
}

class RestaranRepository implements IRestaurantRepository {
  final Dio dio;
  final SharedPreferences sharedPreferences;
  final String path = '/restaurants';

  RestaranRepository(this.dio, this.sharedPreferences);

  @override
  Future<List<Restaurant>> getList({String? search}) async {
    return await dio.get(path, queryParameters: {
      'name': search,
    }).then(
      (value) async {
        final List<Restaurant> restuarants = (value.data as List<dynamic>)
            .map((e) => Restaurant.fromJson(e))
            .toList();

        final String? savedRestaurants =
            sharedPreferences.getString(StorageKeys.restaurants);
        await sharedPreferences.setString(
          StorageKeys.restaurants,
          jsonEncode(restuarants),
        );
        return restuarants;
      },
    );
  }
}
