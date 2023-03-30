import 'package:flutter/foundation.dart';
import 'package:macabis_app/src/blocs/network_bloc.dart';
import 'package:macabis_app/src/models/category/category.dart';
import 'package:rxdart/rxdart.dart';
import 'package:collection/collection.dart';
import '../models/product/product.dart';
import '../repositories/product_repository.dart';

enum SortMethod {
  price,
  rating,
  discount,
}

class ProductBloc implements ProductRepository {
  final _products = BehaviorSubject<List<Product>>.seeded([]);
  final _selectedCategoryProducts = BehaviorSubject<List<Product>>.seeded([]);
  final _categories = BehaviorSubject<List<ProductCategory>?>.seeded(null);
  final NetworkBloc _networkBloc = NetworkBloc();

  Stream<List<Product>> get productsStream => _products.stream;
  Stream<List<ProductCategory>?> get categoriesStream => _categories.stream;
  Stream<List<Product>> get selectedCategoryProductsStream => _selectedCategoryProducts.stream;
  ValueNotifier<SortMethod> sortMethod = ValueNotifier<SortMethod>(SortMethod.price);

  dispose() {
    _products.close();
    _categories.close();
    _selectedCategoryProducts.close();
  }

  void clear() {
    _products.sink.add([]);
    _categories.sink.add([]);
    _selectedCategoryProducts.sink.add([]);
  }

  @override
  Future<void> fetchProducts() async {
    final List<Product> products = await _networkBloc.getProducts();
    _products.sink.add(products);
    groupProducts();
  }

  @override
  void groupProducts() {
    if (_products.value.isEmpty) {
      _categories.sink.add([]);
      return;
    }
    Map<String, List<Product>> groupedItemsMap = _products.value.groupListsBy((element) => element.category);
    List<ProductCategory> categoriesItems = [];
    groupedItemsMap.forEach((category, itemsList) {
      categoriesItems.add(generateCategory(category, itemsList));
    });
    _categories.sink.add(categoriesItems);
  }

  void onCategorySelect(ProductCategory category) {
    _selectedCategoryProducts.sink.add(category.products);
  }

  ProductCategory generateCategory(String category, List<Product> itemsList) {
    return ProductCategory(
      name: category,
      thumbnail: itemsList.first.thumbnail,
      products: itemsList,
      totalSum: itemsList.fold(0, (previousValue, element) => previousValue + element.price),
      totalStock: itemsList.fold(0, (previousValue, element) => previousValue + element.stock),
    );
  }

  void onSortChange(SortMethod val) {
    sortMethod.value = val;
  }
}
