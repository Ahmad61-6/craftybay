import 'package:crafty_bay/data/models/product_model.dart';

class ProductListModel {
  String? msg;
  List<ProductModel>? product;

  ProductListModel({this.msg, this.product});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      product = <ProductModel>[];
      json['data'].forEach((v) {
        product!.add(ProductModel.fromJson(v));
      });
    }
  }
}
