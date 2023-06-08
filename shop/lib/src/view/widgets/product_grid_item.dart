import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/class/cart.dart';
import 'package:shop/src/models/class/product.dart';
import 'package:shop/src/utils/routes/app_routes.dart';

class ProductGridItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final product = Provider.of<Product>(context,listen: false,);
    final cart = Provider.of<Cart>(context,listen: false,);


    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child:GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
          },
          child:  Image.network(product.imageUrl.toString(), fit: BoxFit.cover,)),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, child) =>
            IconButton(
              onPressed: () {
                product.toggleFavorite();
              },
              icon: Icon(product.isfavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
            ),
          ),
          title: Text(product.name.toString(), textAlign: TextAlign.center,),
          trailing:IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text('Produto adicionado com sucesso!'),
                  action: SnackBarAction(
                    label: 'DESFAZER',
                    onPressed: (){
                      cart.removeSingleItem(product.id!);
                    },
                  ),
                )
              );
              cart.addItem(product);
            
              
            },
            icon:const Icon(Icons.shopping_cart),
          ),
        ),
        ),
    );
  }
}