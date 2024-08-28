import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_title.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holders/special_product_controller.dart';
import '../widgets/home/circle_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              searchTextField,
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 220,
                child: GetBuilder<HomeBannerController>(
                    builder: (homeBannerController) {
                  return Visibility(
                    visible: homeBannerController.inProgress == false,
                    replacement: const ShimmerLoader(),
                    child: BannerCarousel(
                      bannerList:
                          homeBannerController.bannerListModel.bannerList ?? [],
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitle(
                  title: 'Popular',
                  onTapSeeAll: () {
                    Get.to(
                      const ProductListScreen(
                        categoryTitle: 'Popular',
                      ),
                    );
                  }),
              GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                return Visibility(
                  visible: popularProductController.inProgress == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: productList(
                      popularProductController.productListModel.productList ??
                          []),
                );
              }),
              const SizedBox(
                width: 8,
              ),
              SectionTitle(
                  title: 'Special',
                  onTapSeeAll: () {
                    Get.to(
                      () => const ProductListScreen(
                        categoryTitle: 'Special',
                      ),
                    );
                  }),
              GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                return Visibility(
                  visible: specialProductController.inProgress == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: productList(
                      specialProductController.productListModel.productList ??
                          []),
                );
              }),
              const SizedBox(
                width: 8,
              ),
              SectionTitle(
                  title: 'New',
                  onTapSeeAll: () {
                    Get.to(
                      () => const ProductListScreen(
                        categoryTitle: 'New',
                      ),
                    );
                  }),
              GetBuilder<NewProductController>(builder: (newProductController) {
                return Visibility(
                  visible: newProductController.inProgress == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: productList(
                      newProductController.productListModel.productList ?? []),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: GetBuilder<CategoryController>(builder: (categoryController) {
        return Visibility(
          visible: categoryController.inProgress == false,
          replacement: const Center(
            child: LinearProgressIndicator(),
          ),
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:
                categoryController.categoryListModel.categoryList?.length ?? 0,
            itemBuilder: (context, index) {
              return CategoryItem(
                category:
                    categoryController.categoryListModel.categoryList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 20,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox productList(List<ProductModel> productList) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ProductCardItem(
            product: productList[index],
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
        decoration: InputDecoration(
      hintText: 'Search',
      filled: true,
      fillColor: Colors.grey.shade200,
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey.shade600,
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none, borderRadius: BorderRadius.circular(8)),
    ));
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logoNav),
      actions: [
        CircleIconButton(
          onTap: () async {
            await Get.find<AuthController>().clearAuthData();
            Get.offAll(() => const VerifyEmailScreen());
          },
          iconData: Icons.person_outline,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.phone_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
      ],
    );
  }
}
