import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/service/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> verifyOtp(email, otp) async {
    _inProgress = true;
    update();
    final ResponseData response =
        await NetworkCaller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      final token = response.responseData['data'];
      //TODO : save to local cache
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      return false;
    }
  }
}
