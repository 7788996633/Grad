import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/user_profile_bloc/user_profile_bloc.dart';
import 'package:graduation/presentation/screens/admin_screens/issues_screens.dart/issuescreen.dart';
import '../../data/models/issues_model.dart';

class IssueItem extends StatefulWidget {
  final IssuesModel issuesModel;
  const IssueItem({super.key, required this.issuesModel});

  @override
  State<IssueItem> createState() => _IssueItemState();
}

class _IssueItemState extends State<IssueItem> {
  late IssuePriority selectedPriority;
  late IssueStatus selectedStatus;

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    selectedPriority = stringToPriority(widget.issuesModel.priority);
    selectedStatus = stringToStatus(widget.issuesModel.status);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => UserProfileBloc(),
                child: IssueScreen(
                  issuesModel: widget.issuesModel,
                ),
              ),
            ),
          );
        },
        title: Text(widget.issuesModel.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("Priority: "),
                isEditing
                    ? DropdownButton<IssuePriority>(
                        value: selectedPriority,
                        items: IssuePriority.values.map((value) {
                          return DropdownMenuItem<IssuePriority>(
                            value: value,
                            child: Text(priorityToString(value)),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedPriority = newValue;
                            });
                          }
                        },
                      )
                    : Text(priorityToString(selectedPriority)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text("Status: "),
                isEditing
                    ? DropdownButton<IssueStatus>(
                        value: selectedStatus,
                        items: IssueStatus.values.map((value) {
                          return DropdownMenuItem<IssueStatus>(
                            value: value,
                            child: Text(statusToString(value)),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedStatus = newValue;
                            });
                          }
                        },
                      )
                    : Text(statusToString(selectedStatus)),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(isEditing ? Icons.check : Icons.edit),
          onPressed: () {
            if (isEditing) {
              // هنا ممكن تضيف حدث الحفظ مثل إرسال القيم للبلوك أو API
              print(
                  'Saving priority: $selectedPriority, status: $selectedStatus');
            }
            setState(() {
              isEditing = !isEditing;
            });
          },
        ),
      ),
    );
  }
}
