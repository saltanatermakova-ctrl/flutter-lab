import 'package:flutter/material.dart';

/// Глобальное состояние темы (светлая / тёмная). Меняется в настройках.
final ValueNotifier<ThemeMode> themeModeNotifier =
    ValueNotifier<ThemeMode>(ThemeMode.light);
