import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:shop/src/models/class/order.dart';
import 'package:shop/src/models/class/product.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
              title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
              subtitle: Text(DateFormat('dd/MM/yy hh:mm').format(widget.order.date)),
              trailing: IconButton(
                icon: Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              )),
              if(_expanded)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height: widget.order.products.length * 40.0,
                child: ListView(
                  children: widget.order.products.map(
                    (product) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.name.toString(), 
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          Text('${product.quantity}x R\$ ${product.price}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey
                          ),
                          )
                        ],
                      );
                    },
                  ).toList(),
                ),
              )
        ],
      ),
    );
  }
}
