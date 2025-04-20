<<<<<<< HEAD
import 'package:graduated/data/services/users_services.dart';

import '../models/user_model.dart';
=======


import '../model/user_model.dart';

import '../services/users_services.dart';
>>>>>>> origin/Fareza

class UsersRepositories {
  Future<List<UserModel>> getAllUsers() async {
    var usersList = await UsersServices().getAllUsers();
    return usersList
        .map(
          (e) => UserModel.fromJson(e),
<<<<<<< HEAD
        )
        .toList();
  }
}
=======
    )
        .toList();
  }
}
>>>>>>> origin/Fareza
