import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/carts/cart_product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Carts'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          CartProductItem(),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(
                        height: 4,
                      ),
                  itemCount: 4),
            ),
            totalPriceAndCheckoutSection,
          ],
        ),
      ),
    );
  }

  Container get totalPriceAndCheckoutSection {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.15),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$100,000.00',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 120,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
