import 'package:path/path.dart';
import '../../../constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/issue_bloc/issues_bloc.dart';

class ListIssueScreen extends StatefulWidget {
  const ListIssueScreen({super.key});

  @override
  State<ListIssueScreen> createState() => _ListIssueScreenState();
}

class _ListIssueScreenState extends State<ListIssueScreen> {
  late IssuesBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<IssuesBloc>(context as BuildContext);
    bloc.add(GetAllIssuesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ادارة القضايا'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text('مرحبا بك')),
              ListTile(
                title: Text('تسجيل خروج'),
                leading: Icon(Icons.logout),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('إضافة قضية جديدة'),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'بحث',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(child: BlocBuilder<IssuesBloc, IssuesState>(
                  builder: (context, state) {
                if (state is IssuesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is IssuesListLoadedSuccessFully) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('id issue')),
                        DataColumn(label: Text('title issue')),
                        DataColumn(label: Text(' priority issue')),
                        DataColumn(label: Text('status issue ')),
                        DataColumn(label: Text('opponentName issue')),
                        DataColumn(label: Text('Edit issue')),
                      ],
                      rows: state.issues.map((caseData) {
                        return DataRow(cells: [
                          DataCell(Text(caseData.id.toString())),
                          DataCell(Text(caseData.title)),
                          DataCell(Text(caseData.priority)),
                          DataCell(Text(caseData.status)),
                          DataCell(Text(caseData.opponentName)),
                          DataCell(
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                // تنفيذ عند الضغط على زر التعديل
                                // مثال: فتح صفحة التعديل أو إظهار Dialog
                              },
                            ),
                          ),
                        ]);
                      }).toList(),
                    ),
                  );
                } else if (state is IssuesLoadedSuccessFully) {
                  return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Column(children: [
                          Text('id issue'),
                          Text('title issue'),
                          Text(' priority issue'),
                          Text('status issue '),
                          Text('opponentName issue')
                        ]),
                        Column(children: [
                          Text(state.issue.id.toString()),
                          Text(state.issue.title),
                          Text(state.issue.priority),
                          Text(state.issue.status),
                          Text(state.issue.opponentName),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // تنفيذ عند الضغط على زر التعديل
                              // مثال: فتح صفحة التعديل أو إظهار Dialog
                            },
                          ),
                        ])
                      ]));
                } else if (state is IssuesFail) {
                  return Center(
                    child: Text(
                      'Error: ${state.errmsg}',
                      style: const TextStyle(color: AppColors.danger),
                    ),
                  );
                } else {
                  return const Center(child: Text('No data yet.'));
                }
              })),
            ],
          ),
        ),
      ),
    );
  }
}
