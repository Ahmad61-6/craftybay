import 'package:crafty_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _emailTEController = TextEditingController();

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
                  height: 160,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text('Welcome back',
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Please enter your email address ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'Email Address'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Please enter a Email address';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(value!)) {
                      return 'Please enter a valid email address';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<SendEmailOtpController>(builder: (controller) {
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
                                final bool result =
                                    await controller.sendOtpToEmail(
                                        _emailTEController.text.trim());
                                _clearTextForm();
                                if (result) {
                                  Get.to(() => const VerifyOTPScreen());
                                } else {
                                  Get.showSnackbar(GetSnackBar(
                                    title: 'Send OTP failed!',
                                    message: controller.errorMessage,
                                    duration: const Duration(seconds: 3),
                                    snackPosition: SnackPosition.TOP,
                                  ));
                                }
                              }
                            },
                            child: const Text('Next')),
                      ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearTextForm() {
    _emailTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
