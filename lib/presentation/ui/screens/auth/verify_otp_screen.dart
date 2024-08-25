import 'package:crafty_bay/presentation/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.email});
  final String email;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text('Enter OTP Code',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'A 4 Digit OTP code has been sent to your email address',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  textInputAction: TextInputAction.next,
                  controller: _otpTEController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.transparent,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.primaryColor,
                      selectedFillColor: Colors.transparent,
                      selectedColor: Colors.purple),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {},
                  appContext: context,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'PIN field in empty!';
                    } else if (value!.length < 4) {
                      return 'The PIN must have 4 digits.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<OtpVerificationController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            bool response = await controller.verifyOtp(
                                widget.email, _otpTEController.text);
                            if (response) {
                              if (controller.shouldNavigateToCompleteProfile) {
                                Get.to(() => const CompleteProfileScreen());
                              } else {
                                Get.offAll(
                                    () => const MainBottomNavBarScreen());
                              }
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'OTP verification failed!',
                                message: controller.errorMessage,
                                duration: const Duration(seconds: 3),
                                snackPosition: SnackPosition.TOP,
                                barBlur: 1.0,
                                backgroundColor: Colors.redAccent,
                                isDismissible: true,
                              ));
                            }
                          }
                        },
                        child: const Text('Next'),
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: const TextSpan(
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(text: 'This code will expire in '),
                        TextSpan(
                            text: '120',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600)),
                      ]),
                ),
                const SizedBox(
                  height: 4,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resend Code',
                      style: TextStyle(color: Colors.grey),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _otpTEController.dispose();
    super.dispose();
  }
}
