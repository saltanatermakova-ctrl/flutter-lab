import 'package:flutter/material.dart';

import '../models/product.dart';
import '../theme.dart';
import '../utils/toast.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(product.icon, size: 96, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(product.name, style: headingStyle(context)),
          const SizedBox(height: 8),
          Text(
            product.price,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Text(product.description),
          const SizedBox(height: 12),
          Text(product.details),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => showToast('${product.name} добавлен в избранное'),
            icon: const Icon(Icons.favorite),
            label: const Text('В избранное'),
          ),
        ],
      ),
    );
  }
}
