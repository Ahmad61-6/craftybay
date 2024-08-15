import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  void changeIndex(int index) {
    // this method changes the nav bar state using index
    if (_selectedIndex == index) {
      return;
    }
    _selectedIndex = index;
    update();
  }

  void backHome() {
    // this method returns to home screen
    changeIndex(0);
  }
}
