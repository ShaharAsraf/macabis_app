import '../models/product/product.dart';

mixin ProductMixin {
  List<Product> _items = [];

  List<Product> get getItems => _items;

  void setItems(List<Product> value) {
    _items = value;
  }

  void removeItem(int index) => _items.removeAt(index);
}
