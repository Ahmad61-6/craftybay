import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/service/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  final String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> sendOtpToEmail(String email) async {
    _inProgress = true;
    update();

    final ResponseData response =
        await NetworkCaller().postRequest(Urls.sendEmailOtp(email));
    if (response.isSuccess) {
      return true;
    } else {
      return false;
    }
  }
}
