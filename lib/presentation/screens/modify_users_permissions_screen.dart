import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduated/blocs/user_bloc/user_bloc.dart';
import 'package:graduated/presentation/widgets/users_list.dart';

class ModifyUsersPermissionsScreen extends StatefulWidget {
  const ModifyUsersPermissionsScreen({super.key});

  @override
  State<ModifyUsersPermissionsScreen> createState() =>
      _ModifyUsersPermissionsScreenState();
}

class _ModifyUsersPermissionsScreenState
    extends State<ModifyUsersPermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocProvider(
                create: (context) => UserBloc(),
                child: const UsersList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
