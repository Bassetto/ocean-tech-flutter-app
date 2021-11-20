import 'package:dio/dio.dart';
import 'package:ocean_tech/app/model/mapping.dart';
import 'package:ocean_tech/app/service/mapping_service.dart';

class MappingServiceApi extends MappingService {

  static final _dio = Dio(BaseOptions(
    baseUrl: 'https://ocean-tech-spring-api.herokuapp.com/api/mapping',
    connectTimeout: 10000,
    receiveTimeout: 6000,
  ));

  @override
  Future<List<Mapping>> list() async {
    try {
      var response = await _dio.get('/list');
      if (response.statusCode == 200) {
        List<Mapping> mapping = [];

        for (dynamic item in response.data) {
          mapping.add(Mapping(item["name"], item["state"]));
        }

        return Future.value(mapping);
      }
      return Future.value(null);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }
}