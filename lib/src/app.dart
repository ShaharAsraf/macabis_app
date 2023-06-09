import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macabis_app/src/blocs/product_bloc_provider.dart';
import 'package:macabis_app/src/screens/main_screen.dart';
import 'package:macabis_app/src/screens/product_screen.dart';
import 'package:macabis_app/src/style/scroll_behavior.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductBlocProvider(
      child: MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Macabis App',
        builder: (ctx, widget) {
          return MediaQuery(
            data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1),
            child: widget!,
          );
        },
        onGenerateRoute: appRoutes,
        navigatorObservers: [routeObserver],
      ),
    );
  }

  Route appRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/product_screen':
        return CupertinoPageRoute(
          builder: (BuildContext context) {
            return const ProductsScreen();
          },
        );
      case '/':
      default:
        return CupertinoPageRoute(
          builder: (BuildContext context) {
            return const MainScreen();
          },
        );
    }
  }
}
