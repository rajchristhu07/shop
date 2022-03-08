import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/model/shop_model.dart';
import 'package:shop/model/treanding_model.dart';

import '../../model/category_model.dart';
import '../../model/product_model.dart';
import '../service/home_services.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get dealModel => _dealModel;
  final List<ProductModel> _dealModel = [];

  List<TrendingModel> get trendModel => _trendModel;
  final List<TrendingModel> _trendModel = [];

  List<ShopModel> get shopModel => _shopModel;
  final List<ShopModel> _shopModel = [];

  HomeViewModel() {
    getBanner();
    getDeal();
    getTrend();
  }

  getBanner() async {
    _loading.value = true;
    HomeService().getBanner().then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }

  getDeal() async {
    _loading.value = true;
    HomeService().getTopDeal().then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      for (int i = 0; i < value.length; i++) {
        _dealModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }

  getTrend() async {
    _loading.value = true;
    HomeService().getTopTrend().then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      for (int i = 0; i < value.length; i++) {
        _trendModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }

  getShopping() async {
    _loading.value = true;
    HomeService().getShop().then((value) {
      if (value.isEmpty) {
        _loading.value = false;
      }
      for (int i = 0; i < value.length; i++) {
        shopModel.add(value[i]);
        _loading.value = false;
      }
      update();
    });
  }
}
