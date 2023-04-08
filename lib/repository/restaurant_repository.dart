import 'package:dio/dio.dart';
import 'package:jenosize/model/restuarant.dart';

abstract class IRestaurantRepository {
  Future<List<Restaurant>> getList({String? search});
}

class RestaranRepository implements IRestaurantRepository {
  final Dio dio;
  final String path = '/restaurants';

  RestaranRepository(this.dio);

  @override
  Future<List<Restaurant>> getList({String? search}) async {
    return await dio.get(path, queryParameters: {
      'name': search,
    }).then(
      (value) => (value.data as List<dynamic>)
          .map((e) => Restaurant.fromJson(e))
          .toList(),
    );
  }
}
