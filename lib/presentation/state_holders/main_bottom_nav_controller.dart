import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  void changeIndex(int index) {
    // this method changes the nav bar state using index
    if (_selectedIndex == index) {
      return;
    }
    if (index == 2 || index == 3) {
      if (Get.find<AuthController>().isTokenNotNull == false) {
        AuthController.goToLogIn();
        return;
      }
    }
    _selectedIndex = index;
    update();
  }

  void backToHome() {
    // this method returns to home screen
    changeIndex(0);
  }
}
