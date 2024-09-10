import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_product_item_count.dart';
import 'package:flutter/material.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({
    super.key,
    // required this.cartItem,
  });
  // final CartItem cartItem;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                AssetsPath.shoe,
                width: 100,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Year Special Shoe',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54),
                            ),
                            Row(
                              children: [
                                Text('Color: Red'),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Size: X')
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline_sharp,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '\$100',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      CustomProductItemCount()
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
