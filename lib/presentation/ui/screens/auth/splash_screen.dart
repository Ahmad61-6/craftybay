import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    // final bool isLoggedIn = await Get.find<AuthController>().isLoggedIn();
    // if (isLoggedIn) {
    Get.offAll(() => const MainBottomNavBarScreen());
    // } else {
    //   Get.offAll(const VerifyEmailScreen());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(
              height: 16,
            ),
            Text('version 1.0'),
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
