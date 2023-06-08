import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/src/models/class/cart.dart';
import 'package:shop/src/models/class/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;


  const CartItemWidget({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).errorColor
        ),
        child: Icon(Icons.delete, color: Colors.white, size: 40,),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Tem Certeza?'),
              content: Text('Quer remover o item do carrinho'),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop(false);
                }, child: Text('Não')),
                TextButton(onPressed: (){
                  Navigator.of(context).pop(true);
                }, child: Text('Sim')),
              ],
            )
        );
      },
      onDismissed: (_){
        Provider.of<Cart>(
          context,
          listen: false
          ).removeItem(cartItem.productId.toString());
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${cartItem.price}'),
              ) 
              ,),
            ),
            title: Text(cartItem.name!),
            subtitle: Text('Total: R\$ ${cartItem.price! * cartItem.quantity!}'),
            trailing: Text('${cartItem.quantity}x'),
          ),
        ),
      ),
    );
  }
}