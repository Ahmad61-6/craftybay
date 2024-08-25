class BannerItem {
  int? id;
  String? title;
  String? shortDes;
  String? image;
  int? productId;
  String? createdAt;
  String? updatedAt;

  BannerItem(
      {this.id,
      this.title,
      this.shortDes,
      this.image,
      this.productId,
      this.createdAt,
      this.updatedAt});

  BannerItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDes = json['short_des'];
    image = json['image'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
