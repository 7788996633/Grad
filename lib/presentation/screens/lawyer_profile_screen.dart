import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/lawyer/lawyer_bloc.dart';
import '../../blocs/lawyer/lawyer_event.dart';
import '../../blocs/lawyer/lawyer_state.dart';

class LawyerProfileScreen extends StatefulWidget {
  const LawyerProfileScreen({super.key});

  @override
  State<LawyerProfileScreen> createState() => _LawyerProfileScreenState();
}

class _LawyerProfileScreenState extends State<LawyerProfileScreen> {
  final TextEditingController salaryController = TextEditingController();
  bool isEditing = false;

  @override
  void dispose() {
    salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LawyerBloc()..add(LoadLawyerEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Lawyer Profile')),
        body: BlocConsumer<LawyerBloc, LawyerState>(
          listener: (context, state) {
            if (state is LawyerError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is LawyerUpdated) {
              setState(() {
                isEditing = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Salary updated successfully')),
              );
            }
          },
          builder: (context, state) {
            if (state is LawyerLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LawyerLoaded || state is LawyerUpdated) {
              final lawyer = (state as dynamic).lawyer;
              if (!isEditing) salaryController.text = lawyer.salary;

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Text("License Number: ${lawyer.licenseNumber}"),
                    Text("Years of Experience: ${lawyer.experienceYears}"),
                    Text("Specialization: ${lawyer.specialization}"),
                    Text("User Type: ${lawyer.type}"),
                    Text("Certificate: ${lawyer.certificate}"),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: salaryController,
                            enabled: isEditing,
                            decoration:
                                const InputDecoration(labelText: "Salary"),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        IconButton(
                          icon: Icon(isEditing ? Icons.check : Icons.edit),
                          onPressed: () {
                            if (isEditing) {
                              final salary = salaryController.text.trim();
                              if (salary.isNotEmpty) {
                                context.read<LawyerBloc>().add(
                                      UpdateLawyerSalaryEvent(salary),
                                    );
                              }
                            } else {
                              setState(() => isEditing = true);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is LawyerError) {
              return Center(child: Text("Error: ${state.message}"));
            }
            return const Center(child: Text("Loading data..."));
          },
        ),
      ),
    );
  }
}
