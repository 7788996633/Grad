import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/issue_bloc/issues_bloc.dart';
import '../../../widgets/custom_text_field.dart';

class CreateIssueScreen extends StatefulWidget {
  const CreateIssueScreen({super.key});

  @override
  State<CreateIssueScreen> createState() => _CreateIssueScreenState();
}

class _CreateIssueScreenState extends State<CreateIssueScreen> {
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController issuenumberController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController courtnameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final TextEditingController startdateController = TextEditingController();
  final TextEditingController enddateController = TextEditingController();
  final TextEditingController totalcostController = TextEditingController();
  final TextEditingController numberofpaymentsController = TextEditingController();
  final TextEditingController opponentnameController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    issuenumberController.dispose();
    categoryController.dispose();
    courtnameController.dispose();
    statusController.dispose();
    priorityController.dispose();
    startdateController.dispose();
    enddateController.dispose();
    totalcostController.dispose();
    numberofpaymentsController.dispose();
    opponentnameController.dispose();
    super.dispose();
  }

  String? validateTextField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  final Color mainColor = const Color(0xFF1E9AD8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("➕ Create Issue"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Form(
              key: myKey,
              child: ListView(
                children: [
                  _buildCardField("Title", titleController, Icons.title),
                  _buildCardField("Issue Number", issuenumberController, Icons.numbers),
                  _buildCardField("Category", categoryController, Icons.category),
                  _buildCardField("Court Name", courtnameController, Icons.account_balance),
                  _buildCardField("Status", statusController, Icons.info_outline),
                  _buildCardField("Priority", priorityController, Icons.priority_high),
                  _buildCardField("Start Date", startdateController, Icons.date_range),
                  _buildCardField("End Date", enddateController, Icons.date_range_outlined),
                  _buildCardField("Total Cost", totalcostController, Icons.attach_money),
                  _buildCardField("Number of Payments", numberofpaymentsController, Icons.payment),
                  _buildCardField("Opponent Name", opponentnameController, Icons.person),
                  const SizedBox(height: 20),
                  BlocConsumer<IssuesBloc, IssuesState>(
                    listener: (context, state) {
                      final msg = state is IssuesSuccess
                          ? state.successmsg
                          : state is IssuesFail
                          ? state.errmsg
                          : null;
                      if (msg != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(msg, style: const TextStyle(fontSize: 16)),
                            backgroundColor: state is IssuesSuccess ? Colors.green : Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (myKey.currentState!.validate()) {
                              BlocProvider.of<IssuesBloc>(context).add(IssueAdd(
                                title: titleController.text,
                                issueNumber: issuenumberController.text,
                                category: categoryController.text,
                                courtName: courtnameController.text,
                                status: statusController.text,
                                priority: priorityController.text,
                                startDate: startdateController.text,
                                endDate: enddateController.text,
                                totalCost: totalcostController.text,
                                numberOfPayments: int.parse(numberofpaymentsController.text),
                                opponentName: opponentnameController.text,
                              ));
                            }
                          },
                          icon: const Icon(Icons.check, color: Colors.white),
                          label: const Text("Create", style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardField(String label, TextEditingController controller, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: CustomTextFeild(
          text: label,
          controller: controller,
          validator: validateTextField,
          color: Colors.transparent,
          icon: icon,
        ),
      ),
    );
  }
}
