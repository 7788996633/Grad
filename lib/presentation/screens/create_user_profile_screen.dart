import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/presentation/screens/user_profile_screen.dart';

import '../../blocs/user_profile_bloc/user_profile_bloc.dart';
import '../widgets/custom_text_field.dart';

class CreateUserProfileScreen extends StatefulWidget {
  const CreateUserProfileScreen({super.key});

  @override
  State<CreateUserProfileScreen> createState() => _AddUserProfileScreenState();
}

class _AddUserProfileScreenState extends State<CreateUserProfileScreen> {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController scientificLevelController =
      TextEditingController();

  final Color mainColor = const Color(0xFF1E9AD8); // Main color

  @override
  void dispose() {
    ageController.dispose();
    addressController.dispose();
    phoneController.dispose();
    scientificLevelController.dispose();
    super.dispose();
  }

  String? validateTextField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("➕ Create Profile"),
        backgroundColor: mainColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: myKey,
          child: ListView(
            children: [
              CustomTextFeild(
                text: "Address",
                controller: addressController,
                validator: validateTextField,
                color: Colors.grey.shade300,
                icon: Icons.home,
              ),
              const SizedBox(height: 12),
              CustomTextFeild(
                text: "Phone",
                controller: phoneController,
                validator: validateTextField,
                color: Colors.grey.shade300,
                icon: Icons.phone,
              ),
              const SizedBox(height: 12),
              CustomTextFeild(
                text: "Age",
                controller: ageController,
                validator: validateTextField,
                color: Colors.grey.shade300,
                icon: Icons.cake,
              ),
              const SizedBox(height: 12),
              CustomTextFeild(
                text: "Scientific Level",
                controller: scientificLevelController,
                validator: validateTextField,
                color: Colors.grey.shade300,
                icon: Icons.school,
              ),
              const SizedBox(height: 20),
              BlocConsumer<UserProfileBloc, UserProfileState>(
                listener: (context, state) {
                  if (state is UserProfileSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.successmsg,
                          style: const TextStyle(fontSize: 16),
                        ),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => UserProfileBloc(),
                          child: const UserProfileScreen(),
                        ),
                      ),
                    );
                  } else if (state is UserProfileFail) {
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
                  return ElevatedButton.icon(
                    onPressed: () {
                      if (myKey.currentState!.validate()) {
                        BlocProvider.of<UserProfileBloc>(context).add(
                          CreateUserProfileEvent(
                            phone: phoneController.text,
                            address: addressController.text,
                            age: ageController.text,
                            scientificLevel: scientificLevelController.text,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.person_add, color: Colors.black87),
                    label: const Text(
                      "Create",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
