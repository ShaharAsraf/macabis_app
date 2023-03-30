import 'dart:convert';
import 'package:macabis_app/src/repositories/network_repository.dart';
import 'package:http/http.dart' as http;
import '../models/product/product.dart';

class NetworkBloc implements NetworkRepository {
  final String _baseUrl = "https://dummyjson.com/products";
  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl?limit=100'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['products'];
        final List<Product> products = jsonData.map((json) => Product.fromJson(json)).toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      return [];
    }
  }
}
