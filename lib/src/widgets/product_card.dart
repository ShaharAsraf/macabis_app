import 'package:flutter/material.dart';
import 'package:macabis_app/src/models/product/product.dart';
import 'package:macabis_app/src/utils/consts.dart';
import '../style/colors.dart';
import 'loading_indicator.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  final Animation<double> animation;
  final Function(BuildContext context, int) removeItem;

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
          key: Key(product.id.toString()),
          onDismissed: (_) => removeItem(context, index),
          child: _renderProduct(),
          background: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          )),
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
          _renderName(),
        ],
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
          return const MyLoader();
        }
      },
    );
  }

  Widget _renderName() {
    return Container(
      decoration: const BoxDecoration(gradient: cardGradient),
      height: 0.3 * thumbnailHeight,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        product.name,
        style: cardNameStyle,
      ),
    );
  }
}
