import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final String details;
  final String price;
  final IconData icon;
  final Color color;

  const Product({
    required this.name,
    required this.description,
    required this.details,
    required this.price,
    required this.icon,
    required this.color,
  });
}

const List<Product> products = [
  Product(
    name: 'Смартфон',
    description: 'Современный смартфон с отличной камерой.',
    details:
        'Экран 6.5", 8 ГБ оперативной памяти, 256 ГБ памяти, тройная камера '
        'и аккумулятор на 5000 мАч.',
    price: '59 990 ₽',
    icon: Icons.smartphone,
    color: Colors.indigo,
  ),
  Product(
    name: 'Ноутбук',
    description: 'Лёгкий ноутбук для учёбы и работы.',
    details:
        'Процессор с 8 ядрами, 16 ГБ памяти, SSD на 512 ГБ, '
        'автономность до 12 часов.',
    price: '84 990 ₽',
    icon: Icons.laptop_mac,
    color: Colors.teal,
  ),
  Product(
    name: 'Наушники',
    description: 'Беспроводные наушники с шумоподавлением.',
    details:
        'Bluetooth 5.3, активное шумоподавление, до 30 часов работы '
        'с кейсом.',
    price: '12 990 ₽',
    icon: Icons.headphones,
    color: Colors.deepOrange,
  ),
  Product(
    name: 'Умные часы',
    description: 'Часы с пульсометром и GPS.',
    details:
        'AMOLED-экран, датчик пульса, GPS, защита от воды, '
        'до 7 дней без подзарядки.',
    price: '19 990 ₽',
    icon: Icons.watch,
    color: Colors.purple,
  ),
];
