import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  final String? categoryTitle;
  final int? categoryId;
  const ProductListScreen({super.key, this.categoryTitle, this.categoryId});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle ?? 'Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 8,
                childAspectRatio: 0.98),
            itemBuilder: (context, index) {
              return const FittedBox(child: ProductCardItem());
            }),
      ),
    );
  }
}
