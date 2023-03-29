import 'package:injectable/injectable.dart';
import 'package:macabis_app/src/models/product/product.dart';

@injectable
class ProductCategory {
  final String name;
  final String thumbnail;
  final List<Product> products;
  final double totalSum;
  final int totalStock;

  ProductCategory({
    required this.name,
    required this.thumbnail,
    required this.products,
    required this.totalSum,
    required this.totalStock,
  });
}
