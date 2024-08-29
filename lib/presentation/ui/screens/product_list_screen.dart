import 'package:crafty_bay/presentation/state_holders/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/product_card_item.dart';

class ProductListScreen extends StatefulWidget {
  final String? categoryTitle;
  final int? categoryId;
  const ProductListScreen({super.key, this.categoryTitle, this.categoryId});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.categoryId != null) {
      Get.find<ProductController>()
          .getProductList(categoryId: widget.categoryId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle ?? 'Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child: GetBuilder<ProductController>(builder: (productController) {
          return Visibility(
            visible: productController.inProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Visibility(
              visible:
                  productController.productListModel.productList?.isNotEmpty ??
                      false,
              replacement: const Center(
                child: Text('No Products Available'),
              ),
              child: GridView.builder(
                  itemCount:
                      productController.productListModel.productList?.length ??
                          0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 2,
                      childAspectRatio: 0.98),
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: ProductCardItem(
                        product: productController
                            .productListModel.productList![index],
                      ),
                    );
                  }),
            ),
          );
        }),
      ),
    );
  }
}
