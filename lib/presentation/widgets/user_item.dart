import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated/blocs/employee_bloc/employee_bloc.dart';
import 'package:graduated/blocs/user_bloc/user_bloc.dart';
import 'package:graduated/data/models/user_model.dart';
import 'package:graduated/presentation/widgets/add_employee_sheet.dart';
import 'package:graduated/presentation/widgets/add_lawyer_sheet.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<UserBloc>(context).add(
              DeleteUserById(
                userId: userModel.id,
              ),
            );
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'Lawyer':
                showBottomSheet(
                  context: context,
                  builder: (context) => const AddLawyerSheet(),
                );
                break;
              case 'Accountant':
              case 'HR':
                showBottomSheet(
                  context: context,
                  builder: (context) => BlocProvider(
                    create: (context) => EmployeeBloc(),
                    child:
                        AddEmployeeSheet(id: userModel.id, selectedRole: value),
                  ),
                );
                break;
            }
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.black,
          ),
          itemBuilder: (context) {
            if (userModel.roleId == 2) {
              return [
                const PopupMenuItem(
                  value: 'Lawyer',
                  child: Text(
                    "Add as a Lawyer",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
                const PopupMenuItem(
                  value: 'Intern',
                  child: Text(
                    "Add as an Intern",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
                const PopupMenuItem(
                  value: 'HR',
                  child: Text(
                    "Add as a HR",
                    style: TextStyle(color: Colors.yellowAccent),
                  ),
                ),
                const PopupMenuItem(
                  value: 'Accountant',
                  child: Text(
                    "Add as an Accountant",
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                ),
              ];
            } else if (userModel.roleId == 3) {
              return [
                const PopupMenuItem(
                  value: 'Lawyer',
                  child: Text(
                    "Add as a Lawyer",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
                const PopupMenuItem(
                  value: 'Intern',
                  child: Text(
                    "Add as an Intern",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
                const PopupMenuItem(
                  value: 'HR',
                  child: Text(
                    "Add as a HR",
                    style: TextStyle(color: Colors.yellowAccent),
                  ),
                ),
                const PopupMenuItem(
                  value: 'Accountant',
                  child: Text(
                    "Add as an Accountant",
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                ),
              ];
            } else if (userModel.roleId == 4) {
              return [
                const PopupMenuItem(
                  value: 'Lawyer',
                  child: Text(
                    "Add as a Lawyer",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
                const PopupMenuItem(
                  value: 'Intern',
                  child: Text(
                    "Add as an Intern",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
                const PopupMenuItem(
                  value: 'HR',
                  child: Text(
                    "Add as a HR",
                    style: TextStyle(color: Colors.yellowAccent),
                  ),
                ),
              ];
            } else {
              return [];
            }
          },
        ),
        title: Text(
          userModel.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          userModel.roleName,
        ),
      ),
    );
  }
}
