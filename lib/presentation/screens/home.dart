import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/lawyer_profile_bloc/lawyer_profiel_bloc.dart';
import 'package:graduation/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:graduation/presentation/screens/create_lawyer_profile_screen.dart';
import 'package:graduation/presentation/screens/create_user_profile_screen.dart';
import 'package:graduation/presentation/screens/modify_users_permissions_screen.dart';
import 'package:graduation/presentation/screens/notifications_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ModifyUsersPermissionsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationsScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications,
            ),
          ),
          const Text("My User Profile"),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => UserProfileBloc(),
                    child: const CreateUserProfileScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.person_pin,
            ),
          ),
          const Text("My Lawwwwyyyyeeeerrrr Profile"),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => LawyerProfileBloc(),
                    child: const CreateLawyerProfileScreen(),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.person_pin,
            ),
          ),
        ],
      ),
    );
  }
}
