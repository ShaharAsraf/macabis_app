// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:macabis_app/src/models/category/category.dart' as _i4;
import 'package:macabis_app/src/models/product/product.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.Product>(() => _i3.Product(
          id: gh<int>(),
          name: gh<String>(),
          description: gh<String>(),
          price: gh<double>(),
          discountPercentage: gh<double>(),
          rating: gh<double>(),
          stock: gh<int>(),
          brand: gh<String>(),
          category: gh<String>(),
          thumbnail: gh<String>(),
        ));
    gh.factory<_i4.ProductCategory>(() => _i4.ProductCategory(
          name: gh<String>(),
          thumbnail: gh<String>(),
          products: gh<List<_i3.Product>>(),
          totalSum: gh<double>(),
          totalStock: gh<int>(),
        ));
    return this;
  }
}
