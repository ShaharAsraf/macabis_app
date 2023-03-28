import 'package:flutter/material.dart';
import 'package:macabis_app/src/screens/product_mixin.dart';
import 'package:macabis_app/src/style/colors.dart';
import 'package:macabis_app/src/widgets/my_app_bar.dart';
import 'package:macabis_app/src/widgets/product_card.dart';

import '../blocs/product_bloc/product_bloc_provider.dart';
import '../models/product/product.dart';
import '../widgets/loading_indicator.dart';

class ProductsScreen extends StatelessWidget with ProductMixin {
  ProductsScreen({Key? key}) : super(key: key);
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<List<Product>?>(
          stream:
              ProductBlocProvider.of(context).selectedCategoryProductsStream,
          builder: (context, snapshot) {
            if (snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData) {
              return const MyLoader();
            }
            setItems(snapshot.data!);
            return _renderProducts(getItems);
          }),
      appBar: const MyAppBar(),
    );
  }

  Widget _renderProducts(List<Product> products) {
    return AnimatedList(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
      key: _listKey,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      initialItemCount: products.length,
      itemBuilder:
          (BuildContext context, int index, Animation<double> animation) =>
              _buildItem(products[index], index, animation),
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

  void _removeItem(BuildContext context, int index) {
    final removedItem = getItems[index];
    ProductBlocProvider.of(context).removeItemFromCategory(removedItem.id);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildItem(removedItem, index, animation),
    );
    removeItem(index);
  }
}
