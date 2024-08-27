import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.white70,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
          ),
          title: const Text(
            'Categories',
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: GetBuilder<CategoryController>(builder: (controller) {
              return Visibility(
                visible: controller.inProgress == false,
                replacement: const LinearProgressIndicator(),
                child: GridView.builder(
                    itemCount:
                        controller.categoryListModel.categoryList!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 8,
                            childAspectRatio: 0.98),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: CategoryItem(
                            category: controller
                                .categoryListModel.categoryList![index]),
                      );
                    }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
