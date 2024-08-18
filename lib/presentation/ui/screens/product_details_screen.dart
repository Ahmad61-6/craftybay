import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/custom_product_item_count.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

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
  Color _selectedColor = Colors.purple;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarousel(),
                  productDetailsBody,
                ],
              ),
            ),
          ),
          priceAndAddToCartSection,
        ],
      ),
    );
  }

  Padding get productDetailsBody {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Happy New Year Special Deal\nSave 30%',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomProductItemCount(),
            ],
          ),
          ratingAndReview,
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
              colors: colors,
              onChange: (selectedColor) {
                _selectedColor = selectedColor;
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
            sizes: sizes,
            onChange: (selectedSize) {},
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
            'Agile is an approach to project management that centers around incremental and iterative steps to completing projects. '
            'The incremental parts of a project are carried out in short-term development cycles.'
            ' The approach prioritizes quick delivery, adapting to change, and collaboration rather than top-down management and following a set plan.',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }

  Row get ratingAndReview {
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
        const Text(
          '4.8',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black45),
        ),
        const SizedBox(
          width: 4,
        ),
        TextButton(
          onPressed: () {},
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
    );
  }
}
