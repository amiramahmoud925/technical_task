import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_task/Model/product_data.dart';
import 'package:technical_task/Views/cart_page.dart';

import '../Providers/cart_provider.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                image: DecorationImage(
                  image: NetworkImage(product.image), fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(product.category.toUpperCase(),
                      style: TextStyle(color: Color(0xFF015B8A),
                        fontSize: 12, fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(product.title, style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          maxLines: 2, overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text("\$${product.price}", style: TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 22),
                            SizedBox(width: 4),
                            Text(product.rating.rate.toString(),
                              style: TextStyle( color: Colors.black,
                                fontWeight: FontWeight.bold, fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 6),
                      Text("(${product.rating.count} reviews)",
                        style: TextStyle(color: Colors.grey[600], fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text("Description", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(product.description, style: TextStyle(
                      fontSize: 16, height: 1.5, color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF015B8A),
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addProduct(product);

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to Cart') ,
                                backgroundColor: Colors.green,)
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                      child: Text("Add to Cart", style: TextStyle(
                          color: Colors.white, fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
