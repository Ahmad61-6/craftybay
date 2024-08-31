import 'package:crafty_bay/presentation/state_holders/create_review_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_review/create_review_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CreateReviewController>().reviewResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
        elevation: 3,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return reviewsScreenBody(index);
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    height: 4,
                  );
                },
                itemCount:
                    Get.find<CreateReviewController>().reviewResponse.length,
              ),
            ),
          ),
          totalReviewAndCreateReview
        ],
      ),
    );
  }

  Container get totalReviewAndCreateReview {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Reviews (1000)',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.black54),
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              Get.to(() => const CreateReviewScreen());
            },
            child: const Icon(
              Icons.add,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Column reviewsScreenBody(index) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person_outline,
                        size: 24,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      Get.find<CreateReviewController>()
                          .reviewResponse[index]
                          .firstName,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      Get.find<CreateReviewController>()
                          .reviewResponse[index]
                          .lastName,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  Get.find<CreateReviewController>()
                      .reviewResponse[index]
                      .reviewDescription,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
