import 'package:flutter/cupertino.dart';

import '../helper/extenstion.dart';

class ProductDetailModel {
  String? name, image, description, qty,rate,offer, price,id;

  ProductDetailModel({this.name, this.image, this.description, this.qty, this.rate, this.offer, this.price, this.id});

  ProductDetailModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    qty = map['qty'];
    rate = map['rate'];
    offer = map['offer'];
    price = map['price'];
    id = map['id'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'qty': qty,
      'rate': rate,
      'offer': offer,
      'price': price,
      'id': id,
    };
  }
}
