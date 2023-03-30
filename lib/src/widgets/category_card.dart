import 'package:flutter/material.dart';
import 'package:macabis_app/src/models/category/category.dart';
import 'package:macabis_app/src/utils/consts.dart';
import '../style/colors.dart';
import 'loading_indicator.dart';

class CategoryCard extends StatelessWidget {
  final ProductCategory category;
  final Function(BuildContext, ProductCategory) onTap;
  const CategoryCard({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context, category),
      child: Card(
        color: cardColor,
        clipBehavior: Clip.hardEdge,
        elevation: 5.0,
        shadowColor: cardShadowColor,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            _renderThumbnail(),
            _renderPriceAndStock(),
            _renderName(),
          ],
        ),
      ),
    );
  }

  Widget _renderThumbnail() {
    return Image.network(
      category.thumbnail,
      height: thumbnailHeight,
      fit: BoxFit.cover,
      loadingBuilder: (
        context,
        child,
        loadingProgress,
      ) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const SizedBox(height: thumbnailHeight, child: MyLoader());
        }
      },
    );
  }

  Widget _renderName() {
    return Container(
      decoration: const BoxDecoration(gradient: categoryTitleGradient),
      height: shadowHeight,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        category.name,
        style: cardNameStyle,
      ),
    );
  }

  Widget _renderPriceAndStock() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(gradient: categoryStockGradient),
        height: shadowHeight,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Stock: ${category.totalStock}',
              style: cardPrice,
            ),
            Text(
              'Total sum: ${category.totalSum.ceil()}\$',
              style: cardPrice,
            ),
          ],
        ),
      ),
    );
  }
}
