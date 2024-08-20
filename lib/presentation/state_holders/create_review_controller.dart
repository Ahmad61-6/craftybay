import 'package:crafty_bay/presentation/ui/screens/product_review/review_response.dart';
import 'package:get/get.dart';

class CreateReviewController extends GetxController {
  final List<ReviewResponse> _reviewResponse = [];

  List<ReviewResponse> get reviewResponse => _reviewResponse;

  void addReview(review) {
    _reviewResponse.add(review);
  }
}
