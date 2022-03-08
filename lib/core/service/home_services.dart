import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/category_model.dart';
import '../../model/product_model.dart';
import '../../model/shop_model.dart';
import '../../model/treanding_model.dart';

class HomeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<CategoryModel>> getBanner() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Banners").get();
    return snapshot.docs
        .map((docSnapshot) => CategoryModel.fromJson(docSnapshot.data()))
        .toList();
  }

  Future<List<ProductModel>> getTopDeal() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Deals").get();
    return snapshot.docs
        .map((docSnapshot) => ProductModel.fromJson(docSnapshot.data()))
        .toList();
  }

  Future<List<TrendingModel>> getTopTrend() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("Trending").get();
    return snapshot.docs
        .map((docSnapshot) => TrendingModel.fromJson(docSnapshot.data()))
        .toList();
  }

  Future<List<ShopModel>> getShop() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("Shop").get();
    return snapshot.docs
        .map((docSnapshot) => ShopModel.fromJson(docSnapshot.data()))
        .toList();
  }
}
