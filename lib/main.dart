import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/locator.dart';
import 'package:shop/view/auth/phone_no_auth.dart';
import 'package:shop/view/main_page/home_page.dart';
import 'package:shop/view/main_page/page/shop.dart';
import 'package:shop/view_model/product_vm/productvm.dart';
import '../res/AppContextExtension.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (BuildContext context) { locator<ProductVM>(); },),
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: context.resources.color.colorPrimary,
      ),
      initialRoute: HomeMainPage.id,
      routes: {
        HomeMainPage.id: (context) =>  HomeMainPage(),
      },
    ));
  }
}

