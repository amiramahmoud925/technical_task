import 'package:flutter/material.dart';
import 'package:technical_task/Core/Utils/constant.dart';
import 'package:technical_task/Views/product_details.dart';
import 'package:technical_task/Widget/icon_button.dart';

import '../Model/product_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key,});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;
  bool _favorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyIconButton(icon: Icons.arrow_back_ios_new, pressed: (){
                  /*
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetails(product: widget.product),
                    ),
                  );*/
                }
                ),
                Center(
                  child: Text("Cart" , style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20 , color: wordColor
                  ),),
                ),
                MyIconButton(icon: Icons.favorite_border, pressed: (){}),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 160,width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage( fit: BoxFit.cover,
                        image: AssetImage("images/hm.png",))
                  ),
                ) ,
                SizedBox(width: 25,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Women’s Collection" , style: TextStyle(
                        fontSize: 12 , color: Color(0x1F1F1F7A)
                      ),),
                      SizedBox(height: 10,),
                      Text("Puff Sleeved Blouse" , style: TextStyle(
                          fontSize: 16 , color: wordColor
                      ),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (quantity > 1) setState(() => quantity--);
                                },
                                child: Icon(Icons.remove, size: 16, color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Text(quantity.toString(), style: TextStyle(fontSize: 16)),
                          SizedBox(width: 15,),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                   setState(() => quantity++);
                                },
                                child: Icon(Icons.add, size: 16, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MyIconButton(
                            icon: _favorite ? Icons.favorite : Icons.favorite_border,
                            pressed: () {
                              setState(() {
                                _favorite = !_favorite;
                              });
                            },
                            color: _favorite ? Colors.red : Colors.grey,
                          ),
                  
                          Spacer(),
                          Text("16.99", style: TextStyle(
                              color:Colors.black,fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Text("Shipping Information" , style: TextStyle(
                      fontSize: 16 , color: wordColor
                  ),),
                ],
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              tileColor: Color(0x1D1D1D0A),
              leading: Image.asset("images/cart.png" , width: 20 , height: 20,),
              title:Text("**** **** **** 5124" , style: TextStyle(
                  fontSize: 16 , color: wordColor
              ),),
              trailing: Icon(Icons.keyboard_arrow_down , size: 25,),
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text("Total (2 Items)", style: TextStyle(
                  fontSize: 16, color: wordColor,
                ),
                ),
                Spacer(),
                Text("\$115.92", style: TextStyle(
                  fontSize: 16, color: wordColor,
                ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text("Shipping Fee", style: TextStyle(
                    fontSize: 16, color: wordColor,
                  ),
                ),
                Spacer(),
                Text("\$0.00", style: TextStyle(
                    fontSize: 16, color: wordColor,
                  ),
                )
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Text("Taxes", style: TextStyle(
                  fontSize: 16, color: wordColor,
                ),
                ),
                Spacer(),
                Text("\$0.00", style: TextStyle(
                  fontSize: 16, color: wordColor,
                ),
                )
              ],
            ),
            Divider(),
            Row(
              children: [
                Column(
                  children: [
                    Text("Total" , style: TextStyle(
                        fontSize: 14 , color: wordColor
                    ),),
                    SizedBox(height: 5,),
                    Text("\$115.92" , style: TextStyle( fontWeight: FontWeight.bold,
                        fontSize: 20 , color: wordColor
                    ),),
                  ],
                ),
                Spacer(),
                Container(
                  height: 50,width: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF015B8A),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text("Checkout" , style: TextStyle(
                    color: Colors.white , fontSize: 16
                  ),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
