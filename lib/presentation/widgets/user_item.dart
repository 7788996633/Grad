import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/user_bloc/user_bloc.dart';
import 'package:graduation/data/models/user_model.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 216, 214, 214),
      child: ListTile(
        leading: userModel.id == 1
            ? const Text("")
            : IconButton(
                onPressed: () {
                  BlocProvider.of<UserBloc>(context).add(
                    DeleteUserById(userId: userModel.id),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              ),
        trailing: userModel.id == 1
            ? const Text("")
            : PopupMenuButton<String>(
                onSelected: (value) async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Confirm Role Change"),
                      content: Text(
                          "Are you sure you want to change the role to '$value'?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text("Confirm"),
                        ),
                      ],
                    ),
                  );
                  if (confirmed == true) {
                    BlocProvider.of<UserBloc>(context).add(
                      ChangeUserRole(
                        userId: userModel.id,
                        role: value.toLowerCase(),
                      ),
                    );
                  }
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                itemBuilder: (context) => getPopupItems(userModel.roleName),
              ),
        title: Text(
          userModel.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(userModel.roleName),
      ),
    );
  }

  List<PopupMenuEntry<String>> getPopupItems(String currentRole) {
    final roleOptions = <String, PopupMenuItem<String>>{
      'Lawyer': const PopupMenuItem<String>(
        value: 'Lawyer',
        child: Text("Change Role To Lawyer",
            style: TextStyle(color: Colors.brown)),
      ),
      'Intern': const PopupMenuItem<String>(
        value: 'Intern',
        child: Text("Change Role To Intern",
            style: TextStyle(color: Colors.orange)),
      ),
      'HR': const PopupMenuItem<String>(
        value: 'HR',
        child: Text("Change Role To HR",
            style: TextStyle(color: Colors.yellowAccent)),
      ),
      'Accountant': const PopupMenuItem<String>(
        value: 'Accountant',
        child: Text("Change Role To Accountant",
            style: TextStyle(color: Colors.green)),
      ),
      'User': const PopupMenuItem<String>(
        value: 'User',
        child: Text("Change Role To User",
            style: TextStyle(color: Colors.blueGrey)),
      ),
      'Admin': const PopupMenuItem<String>(
        value: 'Admin',
        child: Text("You are the admin",
            style: TextStyle(color: Color.fromARGB(255, 179, 34, 106))),
      ),
    };

    final current = currentRole.toUpperCase();

    if (current == 'ADMIN') {
      return [roleOptions['Admin']!];
    }

    final allowedTransitions = <String, List<String>>{
      'LAWYER': ['User'],
      'INTERN': ['Lawyer', 'User'],
      'HR': ['User'],
      'ACCOUNTANT': ['User'],
      'USER': ['Lawyer', 'Intern', 'HR', 'Accountant'],
    };

    final allowed = allowedTransitions[current];
    if (allowed == null) return [];

    return allowed.map((r) => roleOptions[r]!).toList();
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
