import 'package:crafty_bay/data/models/response_data.dart';
import 'package:crafty_bay/data/service/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> sendOtpToEmail(email) async {
    _inProgress = true;
    update();
    final ResponseData response =
        await NetworkCaller().postRequest(Urls.createProfile);
    _inProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
