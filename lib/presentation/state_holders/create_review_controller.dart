import 'package:crafty_bay/presentation/ui/screens/create_review_screen.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController {
  final List<ReviewDetails> _reviewDetails = [];

  List<ReviewDetails> get reviewDetails => _reviewDetails;

  Future<bool> createReview(
      String firstName, String lastName, String reviewDescription) async {
    ReviewDetails reviews =
        ReviewDetails(firstName, lastName, reviewDescription);
    _reviewDetails.add(reviews);
    return true;
  }
}
