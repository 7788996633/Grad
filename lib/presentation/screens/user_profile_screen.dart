import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/profile_bloc/user_profile_bloc.dart';
import 'package:graduation/data/models/profile_model.dart';
import 'package:graduation/presentation/widgets/custom_list_tile.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<UserProfileBloc>(context).add(
      ShowUserProfileEvent(),
    );
    super.initState();
  }

  late ProfileModel profileModel;
  Widget buildProfileModel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomListTile(
          title: profileModel.phone,
          icon: Icons.phone,
        ),
        CustomListTile(
          title: profileModel.address,
          icon: Icons.location_on,
        ),
        CustomListTile(
          title: profileModel.address,
          icon: Icons.event,
        ),
        CustomListTile(
          title: profileModel.address,
          icon: Icons.school,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
        ),
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoadedSuccessfully) {
            profileModel = state.profileModel;
            return buildProfileModel();
          } else if (state is UserProfileFail) {
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
      ),
    );
  }
}
