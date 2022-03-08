import 'package:flutter/cupertino.dart';

import '../helper/extenstion.dart';

class ShopModel {
  String? name, image, description, sized, price;
  Color? color;

  ShopModel(
      {this.name,
        this.image,
        this.description,
        this.color,
        this.sized,
        this.price});

  ShopModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
    };
  }
}
