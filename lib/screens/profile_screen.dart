import 'package:flutter/material.dart';

import '../theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Профиль')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 56,
              child: Icon(Icons.person, size: 64),
            ),
            const SizedBox(height: 16),
            Text('Иван Иванов', style: headingStyle(context)),
            const SizedBox(height: 4),
            const Text('ivan.ivanov@example.com'),
            const SizedBox(height: 24),
            Card(
              shape: cardShape,
              child: const Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text('Имя'),
                    subtitle: Text('Иван Иванов'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('Email'),
                    subtitle: Text('ivan.ivanov@example.com'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
