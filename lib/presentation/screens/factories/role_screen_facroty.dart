import 'package:flutter/material.dart';
import 'package:graduation/presentation/screens/factories/screen_type.dart';
import 'package:graduation/presentation/screens/home/admin_home_page.dart';
import 'package:graduation/presentation/screens/home/hr_home_page.dart';
import 'package:graduation/presentation/screens/home/lawyer_home_page.dart';

import '../home/accountant_home_page.dart';
import '../home/user_home_page.dart';
import '../home/dafault_home_screen.dart';

class RoleScreenFactory {
  static final Map<String, Map<ScreenType, Widget>> roleScreensMap = {
    'admin': {
      ScreenType.main: const AdminHomePage(),
    },
    'lawyer': {
      ScreenType.main: const LawyerHomePage(),
    },
    'user': {
      ScreenType.main: const UserHomePage(),
    },
    'hr': {
      ScreenType.main: const HrHomePage(),
    },
    'accountant': {
      ScreenType.main: const AccountantHomePage(),
    },
  };

  static Widget getScreen(String role, ScreenType screenType) {
    return roleScreensMap[role]?[screenType] ?? const DefaultScreen();
  }
}
