import 'package:flutter/material.dart';

import '../app_state.dart';
import '../theme.dart';
import '../utils/toast.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = true;
  bool _saveHistory = false;
  double _volume = 50;

  @override
  Widget build(BuildContext context) {
    final isDark = themeModeNotifier.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Основные', style: headingStyle(context)),
          const SizedBox(height: 8),
          Card(
            shape: cardShape,
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Тёмная тема'),
                  value: isDark,
                  onChanged: (value) {
                    setState(() {
                      themeModeNotifier.value =
                          value ? ThemeMode.dark : ThemeMode.light;
                    });
                  },
                ),
                SwitchListTile(
                  title: const Text('Уведомления'),
                  value: _notifications,
                  onChanged: (value) => setState(() => _notifications = value),
                ),
                CheckboxListTile(
                  title: const Text('Сохранять историю'),
                  value: _saveHistory,
                  onChanged: (value) =>
                      setState(() => _saveHistory = value ?? false),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Громкость: ${_volume.round()}', style: headingStyle(context)),
          Slider(
            value: _volume,
            min: 0,
            max: 100,
            divisions: 20,
            label: _volume.round().toString(),
            onChanged: (value) => setState(() => _volume = value),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => showToast('Настройки сохранены'),
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }
}
