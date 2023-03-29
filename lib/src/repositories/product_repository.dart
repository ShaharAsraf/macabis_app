import 'package:injectable/injectable.dart';

@injectable
abstract class ProductRepository {
  Future<void> fetchProducts();
  void groupProducts();
}
