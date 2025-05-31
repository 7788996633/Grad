import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/issue_bloc/issues_bloc.dart';

import '../../../blocs/issue_requests_bloc/issue_requests_bloc.dart';
import '../admin_screens/issues_screens.dart/all_issues_screen.dart';
import '../home_web/main_page_web.dart';
import '../issue_request/list_issue_requests_screen.dart';
import 'drawer_web/custom_drawer_web.dart';
class HomeWebPage extends StatefulWidget {
  const HomeWebPage({super.key});
  @override
  State<HomeWebPage> createState() => _HomeWebPageState();
}
class _HomeWebPageState extends State<HomeWebPage> {
  int selectedPage = 0;

  final List<Widget> pages = [
    const MainScreen(),
    //issue
    BlocProvider(
      create: (context) => IssuesBloc(),
      child: const  AllIssuesScreen(),
    ),
   //issue request
    BlocProvider(
      create: (context) => IssueRequestsBloc(),
      child: const  ListIssueRequestsScreen(),
    ),

  ];

  void _onDrawerItemSelected(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomDrawerWeb(onItemSelected: _onDrawerItemSelected),
          Expanded(child: pages[selectedPage]),
        ],
      ),
    );
  }
}