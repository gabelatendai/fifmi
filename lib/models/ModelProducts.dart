// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  String id;
  String foodType;
  String catId;
  String fId;
  String catFoodType;
  String productType;
  String colors;
  String name;
  String des;
  DateTime imageDate;
  String image;
  String price;
  String sizes;
  String totalViews;
  String visibility;

  Products({
    this.id,
    this.foodType,
    this.catId,
    this.fId,
    this.catFoodType,
    this.productType,
    this.colors,
    this.name,
    this.des,
    this.imageDate,
    this.image,
    this.price,
    this.sizes,
    this.totalViews,
    this.visibility,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    id: json["id"],
    foodType: json["food_type"],
    catId: json["cat_id"],
    fId: json["f_id"],
    catFoodType: json["cat_food_type"],
    productType: json["product_type"],
    colors: json["Colors"],
    name: json["name"],
    des: json["des"],
    imageDate: DateTime.parse(json["image_date"]),
    image: json["image"],
    price: json["price"],
    sizes: json["Sizes"],
    totalViews: json["total_views"],
    visibility: json["visibility"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "food_type": foodType,
    "cat_id": catId,
    "f_id": fId,
    "cat_food_type": catFoodType,
    "product_type": productType,
    "Colors": colors,
    "name": name,
    "des": des,
    "image_date": "${imageDate.year.toString().padLeft(4, '0')}-${imageDate.month.toString().padLeft(2, '0')}-${imageDate.day.toString().padLeft(2, '0')}",
    "image": image,
    "price": price,
    "Sizes": sizes,
    "total_views": totalViews,
    "visibility": visibility,
  };
}
