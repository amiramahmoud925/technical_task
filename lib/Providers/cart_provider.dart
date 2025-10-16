import 'package:flutter/material.dart';
import '../Model/cart_item.dart';
import '../Model/product_data.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];
  List<CartItem> get items => List.unmodifiable(_items);

  // Add product
  void addProduct(Product product) {
    final index = _items.indexWhere((i) => i.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity += 1;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners();
  }

  // Increase quantity
  void increaseQuantity(Product product) {
    final index = _items.indexWhere((i) => i.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity += 1;
      notifyListeners();
    }
  }

  // Decrease quantity
  void decreaseQuantity(Product product) {
    final index = _items.indexWhere((i) => i.product.id == product.id);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity -= 1;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  // Remove product from cart
  void removeProduct(Product product) {
    _items.removeWhere((i) => i.product.id == product.id);
    notifyListeners();
  }

  // Toggle favorite
  void toggleFavorite(Product product) {
    final index = _items.indexWhere((i) => i.product.id == product.id);
    if (index >= 0) {
      _items[index].isFavorite = !_items[index].isFavorite;
      notifyListeners();
    }
  }

  // Total price (sum price * quantity)
  double get totalPrice {
    double total = 0;
    for (var i in _items) {
      total += i.product.price * i.quantity;
    }
    return total;
  }

  // Total items count
  int get totalItems {
    int total = 0;
    for (var i in _items) {
      total += i.quantity;
    }
    return total;
  }

  // Clear cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
