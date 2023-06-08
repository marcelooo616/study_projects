import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/class/product_list.dart';
import 'package:shop/src/utils/routes/app_routes.dart';
import 'package:shop/src/view/widgets/app_drawer.dart';
import 'package:shop/src/view/widgets/product_item.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList product = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar produto'),
        actions: [
          IconButton(onPressed:(){
            Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
          }, icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: product.itemsCount,
            itemBuilder: (context, index) => Column(
              children: [
                ProductItem(product: product.items[index],),
                Divider()
              ],
            )
        ),
      )
    );
  }
}
