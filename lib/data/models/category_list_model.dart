import 'package:crafty_bay/data/models/category_list_item.dart';

class CategoryListModel {
  String? msg;
  List<CategoryListItem>? categoryList;

  CategoryListModel({this.msg, this.categoryList});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryList = <CategoryListItem>[];
      json['data'].forEach((v) {
        categoryList!.add(CategoryListItem.fromJson(v));
      });
    }
  }
}
