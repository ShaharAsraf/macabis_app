// import 'package:flutter/material.dart';
// import 'package:macabis_app/src/blocs/product_bloc.dart';
//
// class ProductBlocProvider extends InheritedWidget {
//   final ProductBloc bloc;
//
//   ProductBlocProvider({Key? key, required Widget child})
//       : bloc = ProductBloc(),
//         super(key: key, child: child);
//
//   @override
//   bool updateShouldNotify(oldWidget) => true;
//
//   static ProductBloc of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<ProductBlocProvider>()!
//         .bloc;
//   }
// }
