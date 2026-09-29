import 'package:flutter/material.dart';

import '../theme.dart';
import '../utils/toast.dart';
import '../widgets/app_drawer.dart';
import 'cards_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Элементы списка (10 штук изначально)
  final List<String> _items = List.generate(10, (i) => 'Товар №${i + 1}');

  // Состояние плиток сетки: false - синяя, true - зелёная
  final List<bool> _gridPressed = List.filled(6, false);

  Future<void> _addItem() async {
    final name = await showDialog<String>(
      context: context,
      builder: (_) => const _AddItemDialog(),
    );

    if (name != null && name.trim().isNotEmpty) {
      setState(() {
        _items.add(name.trim());
      });
      showToast('Элемент добавлен: ${name.trim()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Мое приложение'),
          actions: [
            IconButton(
              icon: const Icon(Icons.style),
              tooltip: 'Карточки',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CardsScreen()),
                );
              },
            ),
          ],
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor:
                Theme.of(context).colorScheme.onPrimary.withAlpha(170),
            indicatorColor: Theme.of(context).colorScheme.onPrimary,
            tabs: const [
              Tab(icon: Icon(Icons.list), text: 'Список'),
              Tab(icon: Icon(Icons.grid_view), text: 'Сетка'),
            ],
          ),
        ),
        drawer: const AppDrawer(),
        body: TabBarView(
          children: [
            _buildListTab(),
            _buildGridTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addItem,
          tooltip: 'Добавить элемент',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // ---------- Вкладка «Список» ----------
  Widget _buildListTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text('Список товаров', style: headingStyle(context)),
              ),
              ElevatedButton.icon(
                onPressed: () => showToast('Hello, Flutter!'),
                icon: const Icon(Icons.waving_hand),
                label: const Text('Показать приветствие'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 88),
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final title = _items[index];
              return Card(
                shape: cardShape,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  shape: cardShape,
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: const Icon(Icons.shopping_bag),
                  ),
                  title: Text(title),
                  subtitle: Text('Описание товара (№${index + 1})'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => showToast('Вы выбрали: $title'),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ---------- Вкладка «Сетка» ----------
  Widget _buildGridTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: _gridPressed.length,
      itemBuilder: (context, index) {
        final pressed = _gridPressed[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              _gridPressed[index] = !_gridPressed[index];
            });
            showToast('Вы нажали плитку №${index + 1}');
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              color: pressed ? Colors.green : Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Диалог добавления нового элемента (со своим контроллером).
class _AddItemDialog extends StatefulWidget {
  const _AddItemDialog();

  @override
  State<_AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<_AddItemDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text('Новый элемент'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: const InputDecoration(
          labelText: 'Название',
          border: OutlineInputBorder(),
        ),
        onSubmitted: (value) => Navigator.pop(context, value),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Отмена'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: const Text('Добавить'),
        ),
      ],
    );
  }
}
