import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/presentation/screen/LawyerScreen.dart';
import 'package:untitled5/presentation/screen/login_screen.dart';
import 'package:untitled5/presentation/screen/register_screen.dart';

import 'package:untitled5/presentation/widgets/add_lawyer_sheet.dart';
import 'blocs/add_lawyer_sheet/add_lawyer_bloc.dart';
import 'blocs/auth_bloc/auth_bloc.dart';
import 'blocs/lawyer/lawyer_bloc.dart';
import 'data/services/add_lawyer_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => AuthBloc(
        ),
        child:  RegisterScreen(),
      ),
    );
  }
}
