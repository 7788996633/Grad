import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:graduation/blocs/lawyer_profile_bloc/lawyer_profiel_bloc.dart';
import 'package:graduation/presentation/screens/lawyer_profile_screen.dart';
import 'package:path/path.dart';
import '../widgets/custom_text_field.dart';

class CreateLawyerProfileScreen extends StatefulWidget {
  const CreateLawyerProfileScreen({super.key});

  @override
  State<CreateLawyerProfileScreen> createState() =>
      _CreateLawyerProfileScreenState();
}

class _CreateLawyerProfileScreenState extends State<CreateLawyerProfileScreen> {
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController experienceYearsController =
      TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? certificateFilePath;
  String? resultMessage;

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  Future<void> _pickCertificate() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png', 'docx'],
    );

    if (result != null) {
      setState(() {
        certificateFilePath = result.files.single.path;
      });
      print("📎 Certificate file selected: $certificateFilePath");
    } else {
      print("📭 No file selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Lawyer Profile"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Add As A Lawyer",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16),
                CustomTextFeild(
                  text: 'License Number',
                  controller: licenseNumberController,
                  validator: nameValidator,
                  color: Colors.brown,
                ),
                const SizedBox(height: 10),
                CustomTextFeild(
                  text: 'Experience Years',
                  controller: experienceYearsController,
                  validator: nameValidator,
                  color: Colors.brown,
                ),
                const SizedBox(height: 10),
                CustomTextFeild(
                  text: 'Specialization',
                  controller: specializationController,
                  validator: nameValidator,
                  color: Colors.brown,
                ),
                const SizedBox(height: 10),
                CustomTextFeild(
                  text: 'Salary',
                  controller: salaryController,
                  validator: nameValidator,
                  color: Colors.brown,
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  color: Colors.brown,
                  onPressed: _pickCertificate,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Add certificates "),
                      Icon(Icons.upload_file),
                    ],
                  ),
                ),
                if (certificateFilePath != null)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "📎 File: ${basename(certificateFilePath!)}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                const SizedBox(height: 10),
                BlocConsumer<LawyerProfileBloc, LawyerProfileState>(
                  listener: (context, state) {
                    if (state is LawyerProfileSuccess) {
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
                            create: (context) => LawyerProfileBloc(),
                            child: const LawyerProfileScreen(),
                          ),
                        ),
                      );
                    } else if (state is LawyerProfileFail) {
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
                    return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() ?? false) {
                          if (certificateFilePath == null) {
                            setState(() {
                              resultMessage =
                                  "Please select a certificate file first.";
                            });
                            return;
                          }

                          BlocProvider.of<LawyerProfileBloc>(context).add(
                            CreateLawyerProfileEvent(
                              licenseNumber: licenseNumberController.text,
                              experienceYears: experienceYearsController.text,
                              specialization: specializationController.text,
                              certificatePath: certificateFilePath!,
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Submit'),
                    );
                  },
                ),
                if (resultMessage != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    resultMessage!,
                    style: TextStyle(
                      color: resultMessage!.startsWith("Error")
                          ? Colors.red
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
