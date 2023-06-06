import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/class/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(25),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                'Total:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 10,),
              Chip(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: Text('R\$${cart.totalAmount}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              ?.color))),
              Spacer(),
              TextButton(
                onPressed: (){},
                child: Text('COMPRA'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                  )
                ),)
            ]),
          ),
        )
      ]),
    );
  }
}
