import 'package:dio/dio.dart';
import 'package:jenosize/model/restuarant.dart';

abstract class IRestaurantRepository {
  Future<List<Restaurant>> getList();
}

class RestaranRepository implements IRestaurantRepository {
  final Dio dio;
  final String path = '/restaurants';

  RestaranRepository(this.dio);

  @override
  Future<List<Restaurant>> getList() async {
    return await dio.get(path).then(
          (value) => (value.data as List<dynamic>)
              .map((e) => Restaurant.fromJson(e))
              .toList(),
        );
  }
}
