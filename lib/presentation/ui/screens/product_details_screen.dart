import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_product_item_count.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.offAll(const HomeScreen());
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const ProductImageCarousel(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Happy New Year Special Deal'),
                          CustomProductItemCount(),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Text(
                            '4.8',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Review',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                      const Text('Color')
                    ],
                  ),
                ),
              ],
            ),
          ),
          priceAndAddToCartSection,
        ],
      ),
    );
  }

  Container get priceAndAddToCartSection {
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
                  'Price',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$1,000',
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
                  'Add To Cart',
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
