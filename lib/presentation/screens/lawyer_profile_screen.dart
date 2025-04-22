import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/lawyer_profile_bloc/lawyer_profiel_bloc.dart';
import 'package:graduation/data/models/lawyer_model.dart';
import 'package:graduation/presentation/widgets/custom_list_tile.dart';

class LawyerProfileScreen extends StatefulWidget {
  const LawyerProfileScreen({super.key});

  @override
  State<LawyerProfileScreen> createState() => _LawyerProfileScreenState();
}

class _LawyerProfileScreenState extends State<LawyerProfileScreen> {
  @override
  void initState() {
    BlocProvider.of<LawyerProfileBloc>(context).add(
      ShowLawyerProfileEvent(),
    );
    super.initState();
  }

  late LawyerModel lawyerModel;
  Widget buildProfileModel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomListTile(
          title: lawyerModel.specialization,
          icon: Icons.phone,
        ),
        CustomListTile(
          title: lawyerModel.licenseNumber,
          icon: Icons.location_on,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lawyer Profile",
        ),
      ),
      body: BlocBuilder<LawyerProfileBloc, LawyerProfileState>(
        builder: (context, state) {
          if (state is LawyerProfileLoadedSuccessfully) {
            lawyerModel = state.lawyerModel;
            return buildProfileModel();
          } else if (state is LawyerProfileFail) {
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
