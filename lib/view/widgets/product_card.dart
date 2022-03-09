import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shop/model/product_detail_model.dart';
import 'package:shop/res/Resources.dart';

import 'custom_text.dart';

Card ProductCard(BuildContext context, ProductDetailModel productDetailModel) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2.5,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              CachedNetworkImage(
                fit: BoxFit.cover,
                height: 100.0,
                width: 100.0,
                imageUrl: productDetailModel.image!,
                placeholder: (context, url) => Container(
                  height: 130.0,
                  width: 100.0,
                  color: HexColor("#8AE2E2E2"),
                ),
                errorWidget: (context, url, error) => Container(
                  width: MediaQuery.of(context).size.width,
                  color: HexColor("#8AE2E2E2"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      text: productDetailModel.name!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Resources(context).color.colorBlack,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    CustomText(
                      text: productDetailModel.description!,
                      fontSize: 12,
                      color: Resources(context).color.colorBlack,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: "Price: "+productDetailModel.price!,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Resources(context).color.colorBlack,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                color: Resources(context).color.colorPrimary,
              ),
              width: MediaQuery.of(context).size.width / 2 - 18,
              height: 35,
              child: Center(
                child: Text(
                  "Add",
                  style: TextStyle(
                      color: Resources(context).color.colorWhite,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ));
}
