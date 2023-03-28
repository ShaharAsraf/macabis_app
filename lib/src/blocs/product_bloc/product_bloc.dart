import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:collection/collection.dart';
import '../../models/product/product.dart';
import '../../repositories/product_repository.dart';

class ProductBloc implements ProductRepository {
  factory ProductBloc() {
    instance ??= ProductBloc._();
    instance?.init();
    return instance!;
  }

  ProductBloc._() : super();

  static ProductBloc? instance;
  final _products = BehaviorSubject<List<Product>>.seeded([]);
  final _selectedCategoryProducts = BehaviorSubject<List<Product>>.seeded([]);
  final _categories = BehaviorSubject<List<Product>?>.seeded(null);
  final String _baseUrl = "https://dummyjson.com/products";
  Map<String, List<Product>> groupedItemsMap = {};

  Stream<List<Product>> get productsStream => _products.stream;
  Stream<List<Product>?> get categoriesStream => _categories.stream;
  Stream<List<Product>> get selectedCategoryProductsStream =>
      _selectedCategoryProducts.stream;

  void init() async {
    await fetchProducts();
    groupProducts();
  }

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
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl?limit=100'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['products'];
        final List<Product> products =
            jsonData.map((json) => Product.fromJson(json)).toList();
        _products.sink.add(products);
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      return [];
    }
  }

  @override
  void groupProducts() {
    if (_products.value.isEmpty) {
      _categories.sink.add([]);
      return;
    }
    groupedItemsMap =
        _products.value.groupListsBy((element) => element.category);
    List<Product> categoriesItems = [];
    groupedItemsMap.forEach((category, itemList) {
      categoriesItems.add(itemList.first);
    });
    _categories.sink.add(categoriesItems);
  }

  void onCategorySelect(String category) {
    if (groupedItemsMap[category] != null) {
      _selectedCategoryProducts.sink.add(groupedItemsMap[category]!);
    }
  }

  void removeItemFromCategory(int id) {
    final List<Product> items = _selectedCategoryProducts.value
        .where((element) => element.id != id)
        .toList();
    _selectedCategoryProducts.sink.add(items);
  }
}
