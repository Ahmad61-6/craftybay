import 'package:get/get.dart';

class NoOfItemsCounterController extends GetxController {
  final int _initialItems = 1;
  final int maxItem = 10;

  int get initialItem => _initialItems;
  void decreaseItem(value) {
    if (value > 1) {
      value = value - 1;
    }
    update();
  }
}
