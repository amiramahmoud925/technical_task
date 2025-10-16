import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_task/Core/Utils/constant.dart';
import 'package:technical_task/Views/product_details.dart';
import 'package:technical_task/Widget/icon_button.dart';

import '../Model/product_data.dart';
import '../Providers/cart_provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyIconButton(
                    icon: Icons.arrow_back_ios_new,
                    pressed: () => Navigator.pop(context)),
                Center(
                  child: Text("Cart", style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20,
                      color: wordColor,
                    ),
                  ),
                ),
                MyIconButton(icon: Icons.favorite_border, pressed: () {}),
              ],
            ),
            Expanded(
              child: cartItems.isEmpty
                   ? Center(child: Text("Your Cart is Empty",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  final product = item.product;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 120, width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(fit: BoxFit.cover,
                              image: NetworkImage(product.image),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.category , style: TextStyle(
                                  fontSize: 12 , color: Color(0x1F1F1F7A) ),),
                              SizedBox(height: 10,),
                              Text(product.title, style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: wordColor,
                                ),
                                maxLines: 2, overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    height: 20, width: 20,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          cartProvider.decreaseQuantity(product);
                                          },
                                        child: Icon(Icons.remove, size: 16,
                                            color: Colors.black), ),
                                    ), ),
                                  SizedBox(width: 15,),
                                  Text(item.quantity.toString(),
                                      style: TextStyle(fontSize: 16)
                                  ),
                                  SizedBox(width: 15,),
                                  Container(
                                    height: 20, width: 20,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                    ),
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          cartProvider.increaseQuantity(product);
                                          },
                                        child: Icon(Icons.add, size: 16,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(
                                children: [
                                  MyIconButton(
                                    icon: item.isFavorite ? Icons.favorite : Icons.favorite_border,
                                    pressed: () => cartProvider.toggleFavorite(product),
                                    color: item.isFavorite ? Colors.red : Colors.grey,
                                  ),
                                  Spacer(),
                                  Text("\$${(product.price * item.quantity).toStringAsFixed(2)}",
                                    style: TextStyle(fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () =>
                              cartProvider.removeProduct(product),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Text("Shipping Information" , style: TextStyle(
                      fontSize: 16 , color: wordColor ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Color(0x1D1D1D0A),
              leading: Image.asset("images/cart.png" , width: 20 , height: 20,),
              title:Text("**** **** **** 5124" , style: TextStyle(
                  fontSize: 16 , color: wordColor ),
              ),
              trailing: Icon(Icons.keyboard_arrow_down , size: 25,),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text("Total ( ${cartProvider.totalItems} Items)", style: TextStyle(
                  fontSize: 16, color: wordColor,
                ),
                ),
                Spacer(),
                Text("\$${cartProvider.totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 16, color: wordColor,),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row( children: [
              Text("Shipping Fee", style: TextStyle(
                fontSize: 16, color: wordColor, ),
              ),
              Spacer(),
              Text("\$0.00", style: TextStyle( fontSize: 16, color: wordColor, ),
              ),
            ],
            ),
            SizedBox(height: 15,),
            Row( children: [
              Text("Taxes", style: TextStyle(fontSize: 16, color: wordColor, ),
              ),
              Spacer(),
              Text("\$0.00", style: TextStyle(fontSize: 16, color: wordColor,),
              ),
            ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Total:", style: TextStyle(fontSize: 16, color: wordColor)),
                    SizedBox(height: 5,),
                    Text("\$${cartProvider.totalPrice.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold, color: wordColor,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Container(
                  height: 50, width: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF015B8A),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Checkout",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
