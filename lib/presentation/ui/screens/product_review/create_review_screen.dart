import 'package:crafty_bay/presentation/state_holders/create_review_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/product_review/review_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewDescriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: const Text('Create Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'This section is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'This section is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  controller: _reviewDescriptionTEController,
                  maxLines: 10,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Write Reviews'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'This section is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                GetBuilder<CreateReviewController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _clearFields();
                          if (mounted) {
                            ReviewResponse reviews = ReviewResponse(
                                _firstNameTEController.text.trim(),
                                _lastNameTEController.text,
                                _reviewDescriptionTEController.text);
                            controller.addReview(reviews);
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearFields() {
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _reviewDescriptionTEController.clear();
  }

  @override
  void dispose() {
    _reviewDescriptionTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    super.dispose();
  }
}
