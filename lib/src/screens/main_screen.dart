import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:macabis_app/src/blocs/product_bloc.dart';
import 'package:macabis_app/src/models/category/category.dart';
import 'package:macabis_app/src/widgets/category_card.dart';
import 'package:macabis_app/src/widgets/loading_indicator.dart';
import '../style/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = GetIt.instance.get<ProductBloc>();
    return Scaffold(
      backgroundColor: scaffoldBackground,
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<List<ProductCategory>?>(
          stream: productBloc.categoriesStream,
          builder: (context, snapshot) {
            if (snapshot.data == null ||
                snapshot.connectionState == ConnectionState.waiting ||
                !snapshot.hasData) {
              return const MyLoader();
            }
            return _renderCategories(snapshot.data ?? [], context, productBloc);
          }),
    );
  }

  Widget _renderCategories(List<ProductCategory> products, BuildContext context,
      ProductBloc productBloc) {
    return RefreshIndicator(
      onRefresh: () async {
        await productBloc.init();
      },
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 24.0),
        children: products
            .map(
              (c) => CategoryCard(category: c, onTap: _onCategoryTap),
            )
            .toList(),
      ),
    );
  }

  void _onCategoryTap(
      BuildContext context, ProductCategory category, ProductBloc productBloc) {
    productBloc.onCategorySelect(category);
    Navigator.of(context).pushNamed('/product_screen');
  }
}
