import 'package:flutter/material.dart';
import 'package:macabis_app/src/blocs/product_bloc/product_bloc_provider.dart';
import 'package:macabis_app/src/models/product/product.dart';
import 'package:macabis_app/src/widgets/category_card.dart';
import 'package:macabis_app/src/widgets/loading_indicator.dart';

import '../style/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<List<Product>?>(
          stream: ProductBlocProvider.of(context).categoriesStream,
          builder: (context, snapshot) {
            if (snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData) {
              return const MyLoader();
            }
            return _renderCategories(snapshot.data ?? []);
          }),
    );
  }

  Widget _renderCategories(List<Product> products) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
      children: products
          .map(
            (p) => CategoryCard(
                title: p.category,
                thumbnail: p.thumbnail,
                onTap: _onCategoryTap),
          )
          .toList(),
    );
  }

  void _onCategoryTap(BuildContext context, String category) {
    ProductBlocProvider.of(context).onCategorySelect(category);
    Navigator.of(context).pushNamed('/product_screen');
  }
}
