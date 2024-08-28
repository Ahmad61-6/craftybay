import 'package:crafty_bay/data/models/product_details_data.dart';

class ProductDetailsModel {
  String? msg;
  List<ProductDetailsData>? productDetails;

  ProductDetailsModel({this.msg, this.productDetails});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetails = <ProductDetailsData>[];
      json['data'].forEach((v) {
        productDetails!.add(ProductDetailsData.fromJson(v));
      });
    }
  }
}
