import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/lawyer_profile_bloc/lawyer_profiel_bloc.dart';
import 'lawyer_screens/lawyer_profile_screens/lawyer_profile_screen.dart';

class ProfileScreenLauncher extends StatelessWidget {
  const ProfileScreenLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => LawyerProfileBloc(), // بدون أي أحداث هنا
                    child: const LawyerProfileScreen(),
                  ),
                ));
          },
          child: const Text("اذهب إلى ملفي الشخصي"),
        ),
      ),
    );
  }
}
