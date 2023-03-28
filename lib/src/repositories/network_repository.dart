import 'package:injectable/injectable.dart';
import 'package:macabis_app/src/models/product/product.dart';

@injectable
abstract class NetworkRepository {
  Future<List<Product>> getProducts();
}
