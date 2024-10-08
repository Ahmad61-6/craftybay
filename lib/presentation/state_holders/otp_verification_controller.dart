import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/service/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/read_profile_data_controller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool _shouldNavigateToCompleteProfile = true;
  bool get shouldNavigateToCompleteProfile => _shouldNavigateToCompleteProfile;

  String _token = '';
  String get token => _token;

  Future<bool> verifyOtp(email, otp) async {
    _inProgress = true;
    update();
    final ResponseData response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      _token = response.responseData['data'];
      await Future.delayed(const Duration(seconds: 3));
      final result =
          await Get.find<ReadProfileDataController>().readProfileData(token);
      if (result) {
        _shouldNavigateToCompleteProfile =
            Get.find<ReadProfileDataController>().isProfileCompleted == false;
        if (_shouldNavigateToCompleteProfile == false) {
          Get.find<AuthController>().saveUserDetails(
              _token, Get.find<ReadProfileDataController>().profile);
        }
      } else {
        _errorMessage = Get.find<ReadProfileDataController>().errorMessage;
        update();
        return false;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
