import 'package:flutter/material.dart';
import 'package:macabis_app/src/style/colors.dart';
import 'package:macabis_app/src/utils/consts.dart';
import '../blocs/product_bloc.dart';
import '../blocs/product_bloc_provider.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      actions: [
        PopupMenuButton<SortMethod>(
          itemBuilder: (_) {
            return SortMethod.values.map((e) => _renderPopupItem(e, context)).toList();
          },
          icon: const Icon(Icons.sort),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);

  PopupMenuItem<SortMethod> _renderPopupItem(SortMethod method, BuildContext context) {
    return PopupMenuItem<SortMethod>(
        value: method, child: Text(method.name), onTap: () => ProductBlocProvider.of(context).onSortChange(method));
  }
}
