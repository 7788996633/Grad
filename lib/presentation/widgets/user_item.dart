import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated/blocs/user_bloc/user_bloc.dart';
import 'package:graduated/data/models/user_model.dart';
import 'package:graduated/presentation/widgets/add_lawyer_sheet.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key, required this.userModel});
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: Card(
        child: ListTile(
          leading: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.successmsg,
                      style: const TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
                BlocProvider.of<UserBloc>(context).add(
                  GetAllUsers(),
                );
              } else if (state is UserFail) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.errmsg,
                      style: const TextStyle(fontSize: 16),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return IconButton(
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
              );
            },
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'Lawyer':
                  showBottomSheet(
                    context: context,
                    builder: (context) => const AddLawyerSheet(),
                  );
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
          // IconButton(
          //   onPressed: () {
          // showBottomSheet(
          //   context: context,
          //   builder: (context) => Container(
          //     height: MediaQuery.sizeOf(context).height * 0.5,
          //     width: double.infinity,
          //     color: const Color.fromARGB(255, 181, 176, 174),
          //     child: Column(
          //       children: [
          //         const Text("Change Role"),
          //         MaterialButton(
          //           color: Colors.brown,
          //           onPressed: () {},
          //           child: const Text("Change To Lawyer"),
          //         ),
          //         MaterialButton(
          //           color: Colors.yellow,
          //           onPressed: () {},
          //           child: const Text("Change To HR"),
          //         ),
          //         MaterialButton(
          //           color: Colors.green,
          //           onPressed: () {},
          //           child: const Text("Change To Accountant"),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
          // },
          // icon: const Icon(
          //   Icons.settings,
          // ),
          // ),
          title: Text(
            userModel.name,
          ),
        ),
      ),
    );
  }
}
