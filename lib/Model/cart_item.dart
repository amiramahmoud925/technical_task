import 'package:technical_task/Model/product_data.dart';

class CartItem {
  final Product product;
  int quantity;
  bool isFavorite;

  CartItem({required this.product, this.quantity = 1 ,  this.isFavorite = false,});

  double get totalPrice => product.price * quantity;
}