import 'package:rxdart/rxdart.dart';

import '../../models/product/product.dart';
import '../../repositories/product_repository.dart';

class ProductBloc implements ProductRepository {
  static ProductBloc? instance;
  final _userBadges = BehaviorSubject<List<Product>>.seeded([]);

  Stream<List<Product>> get userBadgesStream => _userBadges.stream;

  factory ProductBloc() {
    instance ??= ProductBloc._();
    return instance!;
  }

  ProductBloc._() : super();

  void init() async {}

  dispose() {
    _userBadges.close();
  }

  void clear() {
    _userBadges.sink.add([]);
  }

  @override
  Future<List<Product>> fetchProducts() {
    throw UnimplementedError();
  }
}
