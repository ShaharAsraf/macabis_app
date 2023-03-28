import 'package:flutter/material.dart';
import 'package:macabis_app/src/utils/consts.dart';
import '../style/colors.dart';
import 'loading_indicator.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String thumbnail;
  final Function(BuildContext, String) onTap;
  const CategoryCard({
    Key? key,
    required this.title,
    required this.thumbnail,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context, title),
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
            _renderName(),
          ],
        ),
      ),
    );
  }

  Widget _renderThumbnail() {
    return Image.network(
      thumbnail,
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
        title,
        style: cardNameStyle,
      ),
    );
  }
}
