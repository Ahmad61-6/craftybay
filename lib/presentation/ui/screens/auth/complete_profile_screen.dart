import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _firstNameTEController = TextEditingController();
  final _lastNameTEController = TextEditingController();
  final _mobileNumberTEController = TextEditingController();
  final _cityTEController = TextEditingController();
  final _shippingAddressTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? formValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 48,
              ),
              const AppLogo(
                height: 80,
              ),
              const SizedBox(
                height: 24,
              ),
              Text('Complete Profile',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 28)),
              Text(
                'Get started with us with your details',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 28,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'First Name'),
                controller: _firstNameTEController,
                validator: formValidator,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'Last Name'),
                controller: _lastNameTEController,
                validator: formValidator,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(hintText: 'Mobile'),
                controller: _mobileNumberTEController,
                validator: formValidator,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: 'City'),
                controller: _cityTEController,
                validator: formValidator,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Shipping Address',
                ),
                controller: _shippingAddressTEController,
                validator: formValidator,
              ),
              const SizedBox(
                height: 24,
              ),
              GetBuilder<CompleteProfileController>(
                  builder: (completeProfileController) {
                return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: completeProfileController.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final createProfileParams = CreateProfileParams(
                                  firstName: _firstNameTEController.text.trim(),
                                  lastName: _lastNameTEController.text.trim(),
                                  mobile: _mobileNumberTEController.text.trim(),
                                  city: _cityTEController.text.trim(),
                                  shippingAddress:
                                      _shippingAddressTEController.text.trim());
                              final result = await completeProfileController
                                  .createProfileData(
                                      Get.find<OtpVerificationController>()
                                          .token,
                                      createProfileParams);
                              if (result) {
                                Get.offAll(const MainBottomNavBarScreen());
                              } else {
                                Get.showSnackbar(
                                  GetSnackBar(
                                    title: 'Complete Profile failed!',
                                    message:
                                        completeProfileController.errorMessage,
                                    isDismissible: true,
                                    backgroundColor: Colors.redAccent,
                                    snackPosition: SnackPosition.TOP,
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text('Complete')),
                    ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
