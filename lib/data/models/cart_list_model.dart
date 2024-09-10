import 'package:crafty_bay/data/models/cart_item.dart';

class CartListModel {
  String? msg;
  List<CartItem>? cartItemList;

  CartListModel({this.msg, this.cartItemList});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartItemList = <CartItem>[];
      json['data'].forEach((v) {
        cartItemList!.add(CartItem.fromJson(v));
      });
    }
  }
}
