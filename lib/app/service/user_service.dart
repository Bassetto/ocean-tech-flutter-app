import 'package:ocean_tech/app/model/user.dart';

abstract class UserService {

  Future<User> login(String username, String password);

  Future<User> register(String name, String username, String password);
}