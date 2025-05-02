import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/lawyer_bloc/lawyer_bloc.dart';
import 'lawyer_list_page.dart';

class LawyerButtonScreen extends StatelessWidget {
  const LawyerButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BlocProvider(
                  create: (_) => LawyerBloc(),
                  child: const LawyersScreen(),
                ),
              ),
            );
          },
          child: const Text("عرض المحاميين"),
        ),
      ),
    );
  }
}
