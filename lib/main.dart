import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:macabis_app/src/app.dart';
import 'package:injectable/injectable.dart';
import 'package:macabis_app/src/blocs/network_bloc.dart';
import 'package:macabis_app/src/blocs/product_bloc.dart';

final getIt = GetIt.instance;

void main() {
  runApp(const MyApp());
  // final myServiceMock = MockMyService();
  //
  // // Register the mock implementation with GetIt
  // final getIt = GetIt.instance;
  // getIt.registerSingleton<MyService>(myServiceMock);
  //    final myDependency = GetIt.instance.get<MyDependency>();
  getIt.registerSingleton<NetworkBloc>(NetworkBloc());
  getIt.registerSingleton<ProductBloc>(ProductBloc());
}

@InjectableInit()
Future<void> configureDependencies(String env) async {
  // $initGetIt(getIt, environment: env);
}
