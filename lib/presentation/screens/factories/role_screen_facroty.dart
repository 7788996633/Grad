import '../home_screens/admin_home_screen.dart';
import '../home_screens/dafault_home_screen.dart';
import '../home_screens/lawyer_home_screen.dart';
import 'role_screen.dart';
import 'screen_type.dart';

class RoleScreenFactory {
  static final Map<String, Map<ScreenType, RoleScreen>> roleScreensMap = {
    'admin': {
      ScreenType.home: AdminHomeScreen(),
    },
    'lawyer': {
      ScreenType.home: LawyerHomeScreen(),
    },
    'user': {
      ScreenType.home: LawyerHomeScreen(),
    },
  };

  static RoleScreen getScreen(String role, ScreenType screenType) {
    final roleScreens = roleScreensMap[role];
    if (roleScreens != null) {
      final screen = roleScreens[screenType];
      if (screen != null) {
        return screen;
      }
    }
    return DefaultScreen();
  }
}
