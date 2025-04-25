import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/lawyer_profile_bloc/lawyer_profiel_bloc.dart';
import 'package:graduation/data/models/lawyer_model.dart';
import 'package:graduation/presentation/screens/edit_lawyer_profile_screen.dart';

class LawyerProfileScreen extends StatefulWidget {
  const LawyerProfileScreen({super.key});

  @override
  State<LawyerProfileScreen> createState() => _LawyerProfileScreenState();
}

class _LawyerProfileScreenState extends State<LawyerProfileScreen> {
  final Color customColor = const Color(0xFF472A0C);
  final Color valueColor = const Color(0xFF0F6829);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LawyerProfileBloc>(context).add(
      ShowLawyerProfileEvent(),
    );
  }

  late LawyerModel lawyer;
  Widget buildInfoTile(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: customColor),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: "$label: ",
                    style: TextStyle(color: customColor),
                  ),
                  TextSpan(
                    text: value,
                    style: TextStyle(color: valueColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileUI() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: customColor,
              child: const Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              "Lawyer Certificate",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            buildInfoTile(Icons.gavel, "Specialization", lawyer.specialization),
            buildInfoTile(Icons.badge, "License Number", lawyer.licenseNumber),
            buildInfoTile(Icons.email, "Email", lawyer.licenseNumber),
            buildInfoTile(Icons.phone, "Phone", lawyer.specialization),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditLawyerProfileScreen(
                    lawyer: lawyer,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: customColor,
        title: const Text(
          "Lawyer Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: BlocBuilder<LawyerProfileBloc, LawyerProfileState>(
        builder: (context, state) {
          if (state is LawyerProfileLoadedSuccessfully) {
            lawyer = state.lawyerModel;
            return buildProfileUI();
          } else if (state is LawyerProfileFail) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "There is an error:",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    state.errmsg,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
