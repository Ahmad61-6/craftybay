import 'package:crafty_bay/presentation/ui/widgets/product_cart_item.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  final String? category;
  const ProductListScreen({super.key, this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category ?? 'Products'),
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
              return const FittedBox(child: ProductCartItem());
            }),
      ),
    );
  }
}
