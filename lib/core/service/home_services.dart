import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/category_model.dart';
import '../../model/product_model.dart';

class HomeService {
  // final CollectionReference _categoryCollectionRef =
  //     FirebaseFirestore.instance.collection('Categories');
  // final CollectionReference _productCollectionRef =
  //     FirebaseFirestore.instance.collection('Products');
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategory() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Categories").get();
    return snapshot.docs
        .map((docSnapshot) => CategoryModel.fromJson(docSnapshot.data()))
        .toList();
  }

  // Future<List<QueryDocumentSnapshot>> getCategory() async {
  //   var value = await _categoryCollectionRef.get();
  //
  //   return value.docs;
  // }

  // Future<List<QueryDocumentSnapshot>> getBestSelling() async {
  //   var value = await _productCollectionRef.get();
  //
  //   return value.docs;
  // }

  Future<List<ProductModel>> getBestSelling() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Products").get();
    return snapshot.docs
        .map((docSnapshot) => ProductModel.fromJson(docSnapshot.data()))
        .toList();
  }
}
