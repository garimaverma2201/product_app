import 'package:product_app/data/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_list_model.g.dart';

@JsonSerializable()
class ProductList {


  ProductList({required this.products, required this.total, required this.skip, required this.limit});

  @JsonKey(name: "products")
  List<Products>? products;
  @JsonKey(name: "total")
  int? total;
  @JsonKey(name: "skip")
  int? skip;
  @JsonKey(name: "limit")
  int? limit;

  factory ProductList.fromJson(Map<String, dynamic> json) => _$ProductListFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}
