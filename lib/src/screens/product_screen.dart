import 'package:flutter/material.dart';
import 'package:macabis_app/src/blocs/product_bloc.dart';
import 'package:macabis_app/src/style/colors.dart';
import 'package:macabis_app/src/widgets/my_app_bar.dart';
import 'package:macabis_app/src/widgets/my_list.dart';
import '../blocs/product_bloc_provider.dart';
import '../models/product/product.dart';
import '../widgets/loading_indicator.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<List<Product>?>(
          stream: ProductBlocProvider.of(context).selectedCategoryProductsStream,
          builder: (context, snapshot) {
            if (snapshot.data == null || snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
              return const MyLoader();
            }
            return _renderProducts(snapshot.data!, context);
          }),
      appBar: const MyAppBar(),
    );
  }

  Widget _renderProducts(List<Product> products, BuildContext context) {
    return ValueListenableBuilder<SortMethod>(
        valueListenable: ProductBlocProvider.of(context).sortMethod,
        builder: (BuildContext context, SortMethod sort, Widget? child) {
          return MyList(
            sortedProducts(products, sort),
          );
        });
  }

  List<Product> sortedProducts(List<Product> products, SortMethod sort) {
    switch (sort) {
      case SortMethod.price:
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortMethod.rating:
        products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case SortMethod.discount:
        products.sort((a, b) => b.discountPercentage.compareTo(a.discountPercentage));
        break;
    }
    return products;
  }
}
