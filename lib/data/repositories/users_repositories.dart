
import '../../data/models/user_model.dart';
import '../services/users_services.dart';

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
