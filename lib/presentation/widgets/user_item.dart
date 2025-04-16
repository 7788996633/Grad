import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/add_lawyer_sheet/add_lawyer_bloc.dart';
import '../../blocs/user_bloc/user_bloc.dart';
import '../../data/model/user_model.dart';
import '../../data/services/add_lawyer_service.dart';
import '../../const.dart';
import 'add_lawyer_sheet.dart'; // يحتوي على myToken

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
              DeleteUserById(userId: userModel.id),
            );
          },
          icon: const Icon(Icons.delete, color: Colors.redAccent),
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'Lawyer':
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => BlocProvider(
                    create: (_) => AddLawyerBloc(
                      service: AddLawyerService(),
                      userId: userModel.id,
                      token: myToken, // تأكد من أن `myToken` متوفر
                    ),
                    child: const AddLawyerSheet(),
                  ),
                );
                break;

            // يمكن إضافة الحالات الأخرى لاحقاً بنفس الطريقة
            }
          },
          icon: const Icon(Icons.settings, color: Colors.black),
          itemBuilder: (context) {
            if (userModel.roleId == 2 || userModel.roleId == 3 || userModel.roleId == 4) {
              return [
                const PopupMenuItem(
                  value: 'Lawyer',
                  child: Text("Add as a Lawyer", style: TextStyle(color: Colors.brown)),
                ),
                const PopupMenuItem(
                  value: 'Intern',
                  child: Text("Add as an Intern", style: TextStyle(color: Colors.brown)),
                ),
                const PopupMenuItem(
                  value: 'HR',
                  child: Text("Add as an HR", style: TextStyle(color: Colors.yellowAccent)),
                ),
                const PopupMenuItem(
                  value: 'Accountant',
                  child: Text("Add as an Accountant", style: TextStyle(color: Colors.greenAccent)),
                ),
              ];
            } else {
              return [];
            }
          },
        ),
        title: Text(userModel.name),
      ),
    );
  }
}
