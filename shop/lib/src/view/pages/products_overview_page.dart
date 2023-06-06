import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/class/cart.dart';
import 'package:shop/src/models/class/product_list.dart';
import 'package:shop/src/view/widgets/contador_badge.dart';
import 'package:shop/src/view/widgets/product_grid.dart';


enum FIlterOptions{
  Favorite,
  All,
}
class ProductsoverviewPage extends StatefulWidget {
  
  @override
  State<ProductsoverviewPage> createState() => _ProductsoverviewPageState();
}

class _ProductsoverviewPageState extends State<ProductsoverviewPage> {
    
    bool _showFavoriteOnly = false;




  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const  Text('Drop Shoes'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
                const PopupMenuItem(
                value: FIlterOptions.Favorite,
                child: Text('Somente Favoritos'),
                ),
                const PopupMenuItem(
                value: FIlterOptions.All,
                child: Text('Todos'),
                )
            ], 
            onSelected: (FIlterOptions selectedValue) {
              setState(() {
                if(selectedValue == FIlterOptions.Favorite){
                  _showFavoriteOnly = true;
              } else {
                  _showFavoriteOnly = false;
              }
              print(_showFavoriteOnly);
              });
              
            },
            ),
            Consumer<Cart>(
              builder: (context, cart, child) => CountBadge(
                value: cart.itemsCount.toString(),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart)
                ),
                
              ),
            )
        ],
      ),
      body:  ProductGrid(showFavoriteOnly:_showFavoriteOnly ),
    );
  }
}

