import 'package:get_it/get_it.dart';

import '../data/network/Api.dart';
import '../view_model/product_vm/productvm.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => ProductVM());
}