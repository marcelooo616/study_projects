import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/src/models/class/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:shop/src/models/class/product.dart';

class Cart with ChangeNotifier {
  
  Map<String, CartItem> _items = {};
  
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price! * cartItem.quantity!;
      });
      return total;
  }

  void addItem(Product product) {
    if(_items.containsKey(product.id)){
      _items.update(
        product.id!,
        (existingItem) => CartItem(
        id: existingItem.id,
        name: existingItem.name,
        quantity: existingItem.quantity! + 1,
        price: existingItem.price,
        productId: existingItem.productId),);
    }else{
      _items.putIfAbsent(product.id!,
        () => CartItem( 
          id: Random().nextDouble().toString(),
          name: product.name,
          quantity: 1,
          price: product.price,
          productId:product.id),);
    }
    notifyListeners();
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId){
    print('k');
    if(!_items.containsKey(productId)){
      return;
    }

    if(_items[productId]?.quantity == 1){
      _items.remove(productId);
    } else {

      _items.update(
        productId,
            (existingItem) => CartItem(
            id: existingItem.id,
            name: existingItem.name,
            quantity: existingItem.quantity! - 1,
            price: existingItem.price,
            productId: existingItem.productId
            ),
      );
    }
    notifyListeners();
  }

  void clear(){
    _items = {};
    notifyListeners();
  }

  
  }
