import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled19/presentation/screens/NotificationItem.dart';
import 'package:untitled19/presentation/screens/home/accountant_main_page.dart';
import 'package:untitled19/presentation/screens/home/client_main_page.dart';
import 'package:untitled19/presentation/screens/home/home_accountant.dart';
import 'package:untitled19/presentation/screens/home/home_hr.dart';
import 'package:untitled19/presentation/screens/home/home_client.dart';
import 'package:untitled19/presentation/screens/home/home_lawyer.dart';
import 'package:untitled19/presentation/screens/home/hr_main_page.dart';
import 'package:untitled19/presentation/screens/home/lawyer_main_page.dart';
import 'package:untitled19/presentation/screens/home_web/home_web_page.dart';

import 'package:untitled19/presentation/screens/login_screen.dart';

import 'blocs/auth_bloc/auth_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home:// HomePage  (),

      BlocProvider(
       create: (context) => AuthBloc(),
       child: const LoginScreen(),
      ),
    );
  }
}
