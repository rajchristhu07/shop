
import 'package:get/get.dart';
import 'package:shop/core/view_model/product_view_model.dart';

import '../core/view_model/auth_view_model.dart';
import '../core/view_model/cart_viewmodel.dart';
import '../core/view_model/control_view_model.dart';
import '../core/view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ProductViewmodel());
    Get.put(CartViewModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
  }
}
