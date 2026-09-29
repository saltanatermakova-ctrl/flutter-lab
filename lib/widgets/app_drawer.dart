import 'package:flutter/material.dart';

import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../utils/toast.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: scheme.primary),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Мое приложение',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: scheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          ListTile(
            leading: const Text('🏠', style: TextStyle(fontSize: 22)),
            title: const Text('Главная'),
            onTap: () {
              Navigator.pop(context); // закрыть меню
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          ListTile(
            leading: const Text('👤', style: TextStyle(fontSize: 22)),
            title: const Text('Профиль'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: const Text('⚙️', style: TextStyle(fontSize: 22)),
            title: const Text('Настройки'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Text('🚪', style: TextStyle(fontSize: 22)),
            title: const Text('Выход'),
            onTap: () {
              Navigator.pop(context);
              showToast('Выход из аккаунта');
            },
          ),
        ],
      ),
    );
  }
}
