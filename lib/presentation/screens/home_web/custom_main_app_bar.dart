import 'package:flutter/material.dart';
import '../settings/setting_screen.dart';

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String selectedLanguage;
  final bool isDarkMode;
  final VoidCallback onToggleTheme;
  final void Function(String) onSelectLanguage;
  final GlobalKey languageKey;

  const CustomMainAppBar({
    super.key,
    required this.selectedLanguage,
    required this.isDarkMode,
    required this.onToggleTheme,
    required this.onSelectLanguage,
    required this.languageKey,
  });

  void _showLanguageMenu(BuildContext context) async {
    final RenderBox renderBox = languageKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + renderBox.size.height,
        position.dx + renderBox.size.width,
        position.dy,
      ),
      items: const [
        PopupMenuItem<String>(
          value: 'العربية',
          child: Text('العربية'),
        ),
        PopupMenuItem<String>(
          value: 'الإنجليزية',
          child: Text('English'),
        ),
      ],
    ).then((selected) {
      if (selected != null) {
        onSelectLanguage(selected);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 45,
        child: Row(
          children: [
            Expanded(
              child: Text(
                'الصفحة الرئيسية',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              tooltip: 'الإشعارات',
              icon: const Icon(Icons.notifications, size: 22, color: Colors.black87),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('لا يوجد إشعارات جديدة')),
                );
              },
            ),
            const SizedBox(width: 12),
            TextButton(
              key: languageKey,
              onPressed: () => _showLanguageMenu(context),
              child: Text(
                'تغيير اللغة - $selectedLanguage',
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              tooltip: isDarkMode ? 'وضع داكن' : 'وضع فاتح',
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                size: 22,
                color: Colors.black87,
              ),
              onPressed: onToggleTheme,
            ),
            const SizedBox(width: 12),
            IconButton(
              tooltip: 'الإعدادات',
              icon: const Icon(Icons.settings, size: 22, color: Colors.black87),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
            const SizedBox(width: 12),
            IconButton(
              tooltip: 'تسجيل الخروج',
              icon: const Icon(Icons.logout, size: 22, color: Colors.black87),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم تسجيل الخروج')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45); // الطول الجديد
}
