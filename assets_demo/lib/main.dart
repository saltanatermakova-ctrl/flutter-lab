import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assets Demo',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Для кнопки "Toggle Image": какое изображение сейчас показано в Stack
  bool _showFirst = true;

  // Режимы BoxFit для эксперимента:
  // BoxFit.fill       - растягивает изображение на весь контейнер, игнорируя
  //                     пропорции (картинка искажается).
  // BoxFit.contain    - вписывает изображение целиком с сохранением пропорций;
  //                     по краям могут остаться пустые полосы.
  // BoxFit.cover      - заполняет весь контейнер с сохранением пропорций;
  //                     лишнее обрезается.
  // BoxFit.fitWidth   - подгоняет по ширине контейнера; по высоте изображение
  //                     может обрезаться или не дотягивать до краёв.
  // BoxFit.fitHeight  - подгоняет по высоте контейнера; по ширине изображение
  //                     может обрезаться или не дотягивать до краёв.
  // BoxFit.none       - оригинальный размер без масштабирования, по центру;
  //                     всё, что выходит за границы, обрезается.
  // BoxFit.scaleDown  - как contain, но только уменьшает; если картинка
  //                     меньше контейнера, остаётся в исходном размере.
  final List<BoxFit> _fits = const [
    BoxFit.fill,
    BoxFit.contain,
    BoxFit.cover,
    BoxFit.fitWidth,
    BoxFit.fitHeight,
    BoxFit.none,
    BoxFit.scaleDown,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Assets')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ---------- Шаг 6: простое отображение image1.jpg ----------
            Image.asset(
              'assets/image1.jpg',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            // ---------- Шаги 7-8: эксперимент с BoxFit ----------
            const Text(
              'Эксперимент с BoxFit',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _fits.length,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(_fits[i].name),
                      const SizedBox(height: 4),
                      // Рамка фиксированного размера, чтобы была видна разница
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/image1.jpg',
                          fit: _fits[i],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ---------- Шаг 9: Stack ----------
            SizedBox(
              width: double.infinity,
              height: 220,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // 1) Фоновое изображение (меняется кнопкой Toggle Image)
                  Image.asset(
                    _showFirst ? 'assets/image1.jpg' : 'assets/image2.jpg',
                    fit: BoxFit.cover,
                  ),
                  // 2) Полупрозрачный чёрный контейнер поверх изображения
                  Container(color: const Color.fromRGBO(0, 0, 0, 0.5)),
                  // 3) Текст поверх контейнера: белый цвет и крупный размер
                  const Center(
                    child: Text(
                      'Welcome to Flutter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ---------- Шаг 10: ElevatedButton ----------
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                fixedSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Hello from SnackBar!')),
                );
              },
              child: const Text('Show SnackBar'),
            ),

            const SizedBox(height: 12),

            // ---------- Шаг 11: TextButton ----------
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.green,
                fixedSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SecondScreen()),
                );
              },
              child: const Text('Go to Second Screen'),
            ),

            const SizedBox(height: 12),

            // ---------- Шаг 12: OutlinedButton ----------
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.black),
                fixedSize: const Size(200, 50),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () {
                setState(() => _showFirst = !_showFirst);
              },
              child: const Text('Toggle Image'),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: const Center(
        child: Text('This is the second screen',
            style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
