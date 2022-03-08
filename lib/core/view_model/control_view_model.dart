import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/main_page/page/shop.dart';
import '../../views/cart_view.dart';
import '../../views/home_view.dart';
import '../../views/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 2;

  get navigatorValue => _navigatorValue;
  Widget currentScreen = ShopMainPage();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = ShopMainPage();
          break;
        }
      case 1:
        {
          currentScreen = CartView();
          break;
        }
      case 2:
        {
          currentScreen = ProfileView();
          break;
        }
    }
    update();
  }
}
