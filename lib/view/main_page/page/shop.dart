
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/theme.dart';
import '../../../view_model/product_vm/productvm.dart';
import '../components/category_list.dart';
import '../components/home_banner.dart';
import '../components/shopping_page.dart';
import '../components/top_trending.dart';
class ShopMainPage extends StatefulWidget {
  const ShopMainPage({Key? key}) : super(key: key);

  @override
  _ShopMainPageState createState() => _ShopMainPageState();
}

class _ShopMainPageState extends State<ShopMainPage> {

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductVM>(context);
    return Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HomeBannerLanding(productProvider),
                  const CategoryList(),
                  const TopTrending(),
                  const ShoppingPage()
                ])));
  }
}
