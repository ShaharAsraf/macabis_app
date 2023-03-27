import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macabis_app/src/screens/main_screen.dart';
import 'package:macabis_app/src/screens/product_screen.dart';
import 'package:macabis_app/src/style/scroll_behavior.dart';
import 'blocs/product_bloc/product_bloc_provider.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductBlocProvider(
      child: MaterialApp(
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        title: 'Hydration App',
        // navigatorKey: NavigationService.navigatorKey,
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
      case '/new_post_screen':
        return CupertinoPageRoute(
          builder: (BuildContext context) {
            //settings.arguments as Map<String, dynamic>
            return const ProductScreen();
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
