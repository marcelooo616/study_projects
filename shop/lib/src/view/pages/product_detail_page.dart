import 'package:flutter/material.dart';
import 'package:shop/src/models/class/product.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child:
                Image.network(product.imageUrl.toString(), fit: BoxFit.cover),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'R\$ ${product.price.toString()}',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              product.description.toString(),
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}
