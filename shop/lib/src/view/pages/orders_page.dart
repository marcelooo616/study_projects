import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/class/order_list.dart';
import 'package:shop/src/view/widgets/app_drawer.dart';
import 'package:shop/src/view/widgets/order.dart';

class OrdersPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (context, index) => OrderWidget(order: orders.items[index])
      
        ),
    );
  }
}