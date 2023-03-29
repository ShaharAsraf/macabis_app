import 'package:flutter/cupertino.dart';
import 'package:macabis_app/src/models/product/product.dart';
import 'package:macabis_app/src/widgets/product_card.dart';

class MyList extends StatefulWidget {
  final List<Product> products;
  const MyList(this.products, {Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late final List<Product> _products;

  @override
  void initState() {
    _products = widget.products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_products.isEmpty) {
      return const Center(
        child: Text('No items'),
      );
    }
    return AnimatedList(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
      key: _listKey,
      shrinkWrap: true,
      initialItemCount: _products.length,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) =>
              _buildItem(_products[index], index, animation),
    );
  }

  Widget _buildItem(
      Product removedItem, int index, Animation<double> animation) {
    return ProductCard(
      product: removedItem,
      index: index,
      animation: animation,
      removeItem: _removeItem,
    );
  }

  void _removeItem(int index) {
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => const SizedBox(height: 0, width: 0),
    );
    _products.removeAt(index);
    if (_products.isEmpty) {
      setState(() {});
    }
  }
}
