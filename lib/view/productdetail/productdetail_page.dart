import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shop/core/view_model/product_detail_vm.dart';

import '../../../utils/theme.dart';
import '../../../view_model/product_vm/productvm.dart';
import '../widgets/appBar.dart';
import '../widgets/end_drawer.dart';
import '../widgets/product_card.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailViewModel>(
        init: Get.find<ProductDetailViewModel>(),
        builder: (controller) => controller.loading.value
            ? Container(
                color: Colors.white,
              )
            : controller.productDetailModel.isNotEmpty
                ? Scaffold(
                    key: _scaffoldKey,
                    endDrawer: endDrawer(context),
                    appBar: appBar(_scaffoldKey),
                    backgroundColor: whiteColor,
                    body: Container(
                      padding: EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height,
                      child: GridView.count(
                        primary: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                        childAspectRatio: 0.90,
                        children: List.generate(controller.productDetailModel.length, (index) {
                          return ProductCard(context,controller.productDetailModel[index]);
                        }),
                      ),
                    ))
                : Container(
                    color: Colors.white,
                  ));
  }
}
