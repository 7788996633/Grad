import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/user_bloc/user_bloc.dart';
import '../../data/models/user_model.dart';
import 'user_item.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UserListState();
}

class _UserListState extends State<UsersList> {
  @override
  void initState() {
    BlocProvider.of<UserBloc>(context).add(
      GetAllUsers(),
    );
    super.initState();
  }

  List<UserModel> usersList = [];
  Widget buildUserModel() {
    return ListView.builder(
      itemCount: usersList.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) => UserItem(
        userModel: usersList[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UsersListLoaded) {
          usersList = state.usersList;
          return usersList.isEmpty
              ? const Text('There is no users')
              : buildUserModel();
        } else if (state is UserFail) {
          return Column(
            children: [
              const Text(
                "There is an error:",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                state.errmsg,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
