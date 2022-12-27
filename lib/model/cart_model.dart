import 'package:flutter/material.dart';
int wc=0;
int ac=0;
int bc=0;
int cc=0;

class CartModel extends ChangeNotifier {
  // list of items on sale
  List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Electronics", "Browse Now", "lib/images/electronics.png", Colors.grey],
    ["Fashion", "Browse Now", "lib/images/fashion.png", Colors.grey],
    ["Groceries", "Browse Now", "lib/images/groceries.png", Colors.grey],
    ["New Arrivals", "Browse Now", "lib/images/newarrivals.png", Colors.grey],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
