import 'package:dio/dio.dart';
import 'package:ocean_tech/app/model/user.dart';
import 'package:ocean_tech/app/service/user_service.dart';

class UserServiceApi extends UserService {

  static final _dio = Dio(BaseOptions(
    baseUrl: 'https://ocean-tech-spring-api.herokuapp.com/api/users',
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  @override
  Future<User> login(String username, String password) async {
    try {
      var response = await _dio.post('/login', data: {'username': username, 'password': password});
      if (response.statusCode == 200) {
        return Future.value(User(response.data["_id"], response.data["name"], response.data["username"]));
      }
      return Future.value(null);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @override
  Future<User> register(String name, String username, String password) async {
    try {
      var response = await _dio.post('/register', data: {'name': name, 'username': username, 'password': password});
      if (response.statusCode == 201) {
        print(response.data);
        return Future.value(User(response.data["_id"], response.data["name"], response.data["username"]));
      }
      return Future.value(null);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

}