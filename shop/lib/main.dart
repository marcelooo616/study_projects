import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/class/cart.dart';
import 'package:shop/src/models/class/order_list.dart';
import 'package:shop/src/models/class/product_list.dart';
import 'package:shop/src/utils/routes/app_routes.dart';
import 'package:shop/src/view/pages/cart_page.dart';
import 'package:shop/src/view/pages/orders_page.dart';
import 'package:shop/src/view/pages/product_detail_page.dart';
import 'package:shop/src/view/pages/product_form_page.dart';
import 'package:shop/src/view/pages/product_page.dart';
import 'package:shop/src/view/pages/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList(),),
        ChangeNotifierProvider(create: (_) => Cart(),),
        ChangeNotifierProvider(create: (_) => OrderList(),),
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
          AppRoutes.HOME: (context) => ProductsoverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailPage(),
          AppRoutes.CART: (context) => CartPage(),
          AppRoutes.ORDERS: (context) => OrdersPage(),
          AppRoutes.PRODUCTS: (context) => ProductPage(),
          AppRoutes.PRODUCT_FORM: (context) => ProductFormPage(),

        },
      ),
    );
  }
}
