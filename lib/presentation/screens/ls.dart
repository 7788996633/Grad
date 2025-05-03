import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/lawyer_bloc/lawyer_bloc.dart';
import 'lawyers_list_screen.dart';

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
                  child: const LawyersListScreen(),
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
