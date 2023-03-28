import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
@injectable
class Product {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'price')
  final double price;
  @JsonKey(name: 'discountPercentage')
  final double discountPercentage;
  @JsonKey(name: 'rating')
  final double rating;
  @JsonKey(name: 'stock')
  final int stock;
  @JsonKey(name: 'brand')
  final String brand;
  @JsonKey(name: 'category')
  final String category;
  @JsonKey(name: 'thumbnail')
  final String thumbnail;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
