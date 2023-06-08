import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/class/product.dart';
import 'package:shop/src/models/class/product_list.dart';
import 'package:shop/src/view/widgets/product_grid_item.dart';

class ProductGrid extends StatelessWidget {
  
  final bool? showFavoriteOnly;

  ProductGrid({this.showFavoriteOnly});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = showFavoriteOnly! ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding:const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: ProductGridItem()
        ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
        )
      );
  }
}