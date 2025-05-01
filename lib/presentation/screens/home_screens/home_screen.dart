import 'package:flutter/material.dart';
import 'package:graduation/constant.dart';

import '../factories/role_screen_facroty.dart';
import '../factories/screen_type.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const screenType = ScreenType.home;
    final screen = RoleScreenFactory.getScreen(
      myRole,
      screenType,
    );
    return screen.build();
  }
}
