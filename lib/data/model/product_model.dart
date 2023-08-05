import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Products {

  Products({ required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images});

  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "discountPercentage")
  double? discountPercentage;
  @JsonKey(name: "rating")
  double? rating;
  @JsonKey(name: "stock")
  int? stock;
  @JsonKey(name: "brand")
  String? brand;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "thumbnail")
  String? thumbnail;
  @JsonKey(name: "images")
  List<String>? images;
  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}