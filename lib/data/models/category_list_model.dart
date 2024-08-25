import 'package:crafty_bay/data/models/category_item.dart';

class CategoryListModel {
  String? msg;
  List<CategoryItem>? categoryList;

  CategoryListModel({this.msg, this.categoryList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryList = <CategoryItem>[];
      json['data'].forEach((v) {
        categoryList!.add(CategoryItem.fromJson(v));
      });
    }
  }
}
