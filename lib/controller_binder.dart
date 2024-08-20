import 'package:crafty_bay/presentation/state_holders/create_review_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/number_of_items_counter_controller.dart';
import 'package:crafty_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(NoOfItemsCounterController());
    Get.put(CreateReviewController());
    Get.put(SendEmailOtpController());
  }
}
