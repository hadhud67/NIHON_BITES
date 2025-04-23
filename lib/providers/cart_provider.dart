import 'package:flutter/material.dart';
import '../models/food_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Food> _cartItems = [];

  List<Food> get cartItems => _cartItems;

  void addToCart(Food food) {
    final index = _cartItems.indexWhere((item) => item.name == food.name);
    if (index >= 0) {
      _cartItems[index] = _cartItems[index].copyWith(
        quantity: _cartItems[index].quantity + food.quantity,
      );
    } else {
      _cartItems.add(food);
    }
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      _cartItems[index] = _cartItems[index].copyWith(quantity: newQuantity);
      notifyListeners();
    }
  }

  double get totalPrice {
    return _cartItems.fold(
      0,
          (sum, item) => sum + (item.price * item.quantity),
    );
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}