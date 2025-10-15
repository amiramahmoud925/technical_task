import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_task/Providers/cart_provider.dart';
import 'package:technical_task/Views/home.dart';
import 'package:technical_task/Views/main_screen.dart';
import 'package:technical_task/Views/product_details.dart';
import 'Providers/product_provider.dart';
import 'Views/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}




