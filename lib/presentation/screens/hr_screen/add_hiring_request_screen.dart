import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/hiring_requests/hiring_requests_block.dart';
import '../../../blocs/hiring_requests/hiring_requests_event.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../../constant.dart';
import '../../widgets/appbar/custom_appbar_title.dart';
import '../../widgets/button/elevated_button_submit.dart';

class AddHiringRequestScreen extends StatefulWidget {
  const AddHiringRequestScreen({super.key});

  @override
  State<AddHiringRequestScreen> createState() => _AddHiringRequestScreenState();
}

class _AddHiringRequestScreenState extends State<AddHiringRequestScreen> {
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool _isLoading = false;

  void _submitRequest() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Hiring request submitted successfully!"),
          backgroundColor: Colors.green,
        ),
      );

      _jobTitleController.clear();
      _typeController.clear();
      _descriptionController.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      appBar:   customAppBar("Add Hiring Request"),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isSmallScreen ? double.infinity : 600,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _jobTitleController,
                        label: 'Job Title',
                        icon: Icons.work_outline,
                      ),
                      SizedBox(height: isSmallScreen ? 20 : 30),
                      _buildTextField(
                        controller: _typeController,
                        label: 'Type',
                        icon: Icons.category_outlined,
                      ),
                      SizedBox(height: isSmallScreen ? 20 : 30),
                      _buildTextField(
                        controller: _descriptionController,
                        label: 'Description',
                        icon: Icons.description_outlined,
                        maxLines: 4,
                      ),
                      const SizedBox(height: 40),
                      _isLoading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                        width: double.infinity,
                        child: CustomElevatedButtonSubmit(
                          label: "Submit",
                          onPressed: () {
                            BlocProvider.of<HiringRequestsBloc>(context).add(
                              CreateHiringRequestsEvent(
                                jopTitle: _jobTitleController.text,
                                type: _typeController.text,
                                description: _descriptionController.text,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        labelStyle: const TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
