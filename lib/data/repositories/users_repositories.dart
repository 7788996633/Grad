import 'package:graduated/data/services/users_services.dart';

import '../models/user_model.dart';

class UsersRepositories {
  Future<List<UserModel>> getAllUsers() async {
    var usersList = await UsersServices().getAllUsers();
    return usersList
        .map(
          (e) => UserModel.fromJson(e),
        )
        .toList();
  }
}
