import 'package:crafty_bay/data/models/product_details_data.dart';
import 'package:crafty_bay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/product_details_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_review/reviews_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_product_item_count.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productID});
  final int productID;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [
    Colors.purple,
    Colors.amber,
    Colors.grey,
    AppColors.primaryColor,
    Colors.brown
  ];
  List<String> sizes = ['X', 'XL', '2L', 'L'];
  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsController>().getProductDetails(widget.productID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.inProgress) {
          return const LinearProgressIndicator();
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarousel(
                      urls: [
                        productDetailsController.productDetails.img1 ?? '',
                        productDetailsController.productDetails.img2 ?? '',
                        productDetailsController.productDetails.img3 ?? '',
                        productDetailsController.productDetails.img4 ?? '',
                      ],
                    ),
                    productDetailsBody(productDetailsController.productDetails),
                  ],
                ),
              ),
            ),
            priceAndAddToCartSection,
          ],
        );
      }),
    );
  }

  Padding productDetailsBody(ProductDetailsData productDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productDetails.product?.title ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomProductItemCount(),
            ],
          ),
          ratingAndReview(
              productDetails.product?.star ?? 0, productDetails.productId ?? 0),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Color',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
          const SizedBox(
            height: 8,
          ),
          ColorSelector(
              colors: productDetails.color
                      ?.split(',')
                      .map((e) => getColorFromString(e))
                      .toList() ??
                  [],
              onChange: (selectedColor) {
                _selectedColor = selectedColor.toString();
              }),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
          const SizedBox(
            height: 8,
          ),
          SizeSelector(
            sizes: productDetails.size?.split(',') ?? [],
            onChange: (selectedSize) {
              _selectedSize = selectedSize;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
          Text(
            productDetails.des ?? '',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }

  Row ratingAndReview(double rating, int productId) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          size: 20,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          rating.toStringAsPrecision(2),
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black45),
        ),
        const SizedBox(
          width: 4,
        ),
        TextButton(
          onPressed: () {
            Get.to(
              () => ReviewsScreen(
                productId: productId,
              ),
            );
          },
          child: const Text(
            'Review',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(
            Icons.favorite_outline,
            color: Colors.white,
            size: 18,
          ),
        ),
      ],
    );
  }

  Container get priceAndAddToCartSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.15),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                '\$${Get.find<ProductDetailsController>().productDetails.product?.price}',
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child:
                GetBuilder<AddToCartController>(builder: (addToCartController) {
              return Visibility(
                visible: addToCartController.inProgress == false,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_selectedColor != null && _selectedSize != null) {
                      if (Get.find<AuthController>().isTokenNotNull) {
                        bool response = await addToCartController.addToCart(
                            widget.productID, _selectedColor!, _selectedSize!);
                        if (response) {
                          Get.showSnackbar(
                            const GetSnackBar(
                              message: 'Product has been added to cart',
                              backgroundColor: Colors.greenAccent,
                              snackPosition: SnackPosition.TOP,
                              dismissDirection: DismissDirection.up,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          Get.showSnackbar(
                            GetSnackBar(
                              message: addToCartController.errorMessage,
                              backgroundColor: Colors.red,
                              snackPosition: SnackPosition.TOP,
                              dismissDirection: DismissDirection.up,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      } else {
                        Get.to(() => const VerifyEmailScreen());
                      }
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          message: 'Please select Color and Size',
                          duration: Duration(seconds: 2),
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Add To Cart',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Color getColorFromString(String colorCode) {
    String code = colorCode.replaceAll('#', '');
    String hexCode = 'FF$code';
    return Color(int.parse('0x$hexCode'));
  }
}
