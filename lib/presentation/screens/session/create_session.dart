/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_event.dart';
import '../../../blocs/issue_requests_bloc/issue_requests_state.dart';
import '../../../blocs/sessions/sessions_bloc.dart';
import '../../../blocs/sessions/sessions_event.dart';
import '../../../blocs/sessions/sessions_state.dart';
import '../../widgets/build_custom_appbar_detials.dart';
import '../../widgets/custom_text_field_add.dart';
import '../../widgets/elevated_button_submit.dart';
import 'attend_radio.dart';

class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({Key? key}) : super(key: key);

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  AttendStatus? _selectedAttendStatus; // الحالة للاختيار

  int? get isAttendValue {
    if (_selectedAttendStatus == AttendStatus.attend) return 1;
    if (_selectedAttendStatus == AttendStatus.absent) return 0;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: buildCustomAppBar("Create Session"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<SessionsBloc, SessionsState>(
          listener: (context, state) {
            if (state is SessionsSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Success: ${state.successmsg}"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is SessionsFail) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Failed: ${state.errmsg}"),
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Create New Session",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),

                    CustomTextFieldAdd(
                      controller: _typeController,
                      label: 'Type',
                    ),

                    const SizedBox(height: 20),

                    CustomTextFieldAdd(
                      controller: _descriptionController,
                      label: 'Description',
                      maxLines: 5,
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),

                    const SizedBox(height: 20),

                    AttendRadio(
                      selectedStatus: _selectedAttendStatus,
                      onChanged: (AttendStatus? val) {
                        setState(() {
                          _selectedAttendStatus = val;
                        });
                      },
                    ),

                    const SizedBox(height: 30),

                    if (state is IssueRequestsLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      SizedBox(
                        height: 50,
                        child: CustomElevatedButtonSubmit(
                          label: "Submit",
                          onPressed: () {
                            BlocProvider.of<SessionsBloc>(context).add(
                              CreateSessionsEvent(
                                type: _typeController.text,
                                lawyerId: 0,       // قيمة افتراضية بدل null
                                isAttend: isAttendValue ?? 0,  // تأكد من عدم مرور null، 0 إذا null
                                sessionId: 0,      // قيمة افتراضية بدل null
                              ),
                            );

                          },
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
*/