import 'package:flutter/material.dart';
import 'package:recogenie_task/data/model/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    required this.productModel,
    required this.onAddToCart, // 1. إضافة الدالة للـ constructor
  });

  final ProductModel productModel;
  final VoidCallback onAddToCart; // 1. تعريف الدالة

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name ?? '',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${productModel.price?.toStringAsFixed(2) ?? ''}',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 12), // مسافة قبل الزر
                  // 2. إضافة الزر
                  ElevatedButton(
                    onPressed: onAddToCart, // ربط الدالة بحدث الضغط
                    style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: theme.colorScheme.onPrimary,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(horizontal: 16)),
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 100,
              height: 100, // تم زيادة الارتفاع ليتناسب مع الزر
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  productModel.imageUrl ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.fastfood, color: Colors.grey);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
