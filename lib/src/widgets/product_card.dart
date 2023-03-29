import 'package:flutter/material.dart';
import 'package:macabis_app/src/models/product/product.dart';
import 'package:macabis_app/src/utils/consts.dart';
import '../style/colors.dart';
import 'loading_indicator.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  final Animation<double> animation;
  final Function(int) removeItem;

  const ProductCard({
    Key? key,
    required this.product,
    required this.index,
    required this.animation,
    required this.removeItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: Axis.vertical,
      sizeFactor: animation,
      child: Dismissible(
          key: UniqueKey(),
          onDismissed: (_) => removeItem(index),
          direction: DismissDirection.startToEnd,
          background: _renderDelete(),
          child: _renderProduct()),
    );
  }

  Widget _renderProduct() {
    return Card(
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
          _renderPriceAndRating(),
          _renderName(),
        ],
      ),
    );
  }

  Widget _renderDelete() {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _renderThumbnail() {
    return Image.network(
      product.thumbnail,
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
      padding: const EdgeInsets.all(10),
      child: Text(
        product.name,
        style: cardNameStyle,
      ),
    );
  }

  Widget _renderPriceAndRating() {
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
              'Price: ${product.price}\$',
              style: cardPrice,
            ),
            Text(
              'Rating: ${product.rating}★',
              style: cardPrice,
            ),
          ],
        ),
      ),
    );
  }
}
