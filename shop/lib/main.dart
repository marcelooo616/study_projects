import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/class/cart.dart';
import 'package:shop/src/models/class/product_list.dart';
import 'package:shop/src/providers/couter.dart';
import 'package:shop/src/utils/routes/app_routes.dart';
import 'package:shop/src/view/pages/counter_page.dart';
import 'package:shop/src/view/pages/product_detail_page.dart';
import 'package:shop/src/view/pages/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList(),),
        ChangeNotifierProvider(create: (_) => Cart(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'
        ),
        home:  ProductsoverviewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailPage(),
        },
      ),
    );
  }
}
