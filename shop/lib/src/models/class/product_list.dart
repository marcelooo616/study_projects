import 'package:flutter/material.dart';
import 'package:shop/src/models/class/product.dart';
import 'package:shop/src/models/data/dummy_data.dart';

class ProductList with ChangeNotifier {
    List<Product> _items = dummyProducts;

    List<Product> get items => [..._items];
    List<Product> get favoriteItems =>  _items.where((element) => element.isfavorite).toList();
    
    int get itemsCount{
      return _items.length;
    }
    void addproduct(Product product) {
      _items.add(product);
      notifyListeners();
    }
}

/*bool _showFavoriteOnly = false;

    List<Product> get items {
      if(_showFavoriteOnly) {
        return _items.where((element) => element.isfavorite).toList();  
      }
      return [..._items];
    }

    void showFavoriteOnly(){
      _showFavoriteOnly = true;
      notifyListeners();
    }

    void showAll(){
      _showFavoriteOnly = false;
      notifyListeners();
    }*/