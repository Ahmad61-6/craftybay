import 'package:crafty_bay/data/models/product_model.dart';

class CartItem {
  int? id;
  String? email;
  int? productId;
  String? color;
  String? size;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;
  int quantity = 1;

  CartItem(
      {this.id,
      this.email,
      this.productId,
      this.color,
      this.size,
      this.createdAt,
      this.updatedAt,
      this.product});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    createdAt = json['created_at'];
    quantity = int.tryParse(json['qty']) ?? 1;
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }
}
