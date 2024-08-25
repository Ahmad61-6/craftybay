import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_banner_contorller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/categories_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/section_title.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      child: BannerCarousel(
                    bannerList:
                        homeBannerController.bannerListModel.bannerList ?? [],
                  ));
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
                    Get.to(const ProductListScreen());
                  }),
              productList,
              const SizedBox(
                width: 8,
              ),
              SectionTitle(
                  title: 'Special',
                  onTapSeeAll: () {
                    Get.offAll(const CategoriesScreen());
                  }),
              productList,
              const SizedBox(
                width: 8,
              ),
              SectionTitle(
                  title: 'New',
                  onTapSeeAll: () {
                    Get.offAll(const CategoriesScreen());
                  }),
              productList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductCardItem();
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
