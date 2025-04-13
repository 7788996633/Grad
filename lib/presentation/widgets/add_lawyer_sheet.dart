import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class AddLawyerSheet extends StatefulWidget {
  const AddLawyerSheet({super.key});

  @override
  State<AddLawyerSheet> createState() => _AddLawyerSheetState();
}

class _AddLawyerSheetState extends State<AddLawyerSheet> {
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController experienceYearsController = TextEditingController();
  TextEditingController specializationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  GlobalKey<FormState> myKey = GlobalKey<FormState>();
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.black54,
      height: MediaQuery.sizeOf(context).height * 0.7,
      width: double.infinity,
      child: Form(
        key: myKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Add As A Lawyer"),
            CustomTextFeild(
                text: 'license_number',
                controller: licenseNumberController,
                validator: nameValidator,
                color: Colors.brown),
            CustomTextFeild(
                text: 'experience_years',
                controller: licenseNumberController,
                validator: nameValidator,
                color: Colors.brown),
            CustomTextFeild(
                text: 'specialization',
                controller: licenseNumberController,
                validator: nameValidator,
                color: Colors.brown),
            CustomTextFeild(
                text: 'salary',
                controller: licenseNumberController,
                validator: nameValidator,
                color: Colors.brown),
            MaterialButton(
              color: Colors.brown,
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add certificates ",
                  ),
                  Icon(
                    Icons.upload_file,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Add",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
