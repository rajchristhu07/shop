import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/main_page/page/shop.dart';


class ControlViewModel extends GetxController {
  int _navigatorValue = 2;

  get navigatorValue => _navigatorValue;
  Widget currentScreen = ShopMainPage();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen =  Container();
          break;
        }
      case 1:
        {
          currentScreen = Container();
          break;
        }
      case 2:
        {
          currentScreen = ShopMainPage();
          break;
        }
      case 3:
        {
          currentScreen = Container();
          break;
        }
      case 4:
        {
          currentScreen = Container();
          break;
        }
    }
    update();
  }
}
