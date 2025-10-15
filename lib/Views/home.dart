import 'package:flutter/material.dart';
import 'package:technical_task/Core/Utils/constant.dart';
import 'package:technical_task/Views/product_details.dart';
import 'package:technical_task/Widget/icon_button.dart';
import 'package:technical_task/Widget/prands.dart';
import '../Services/api_service.dart';
import '../Model/product_data.dart';
import '../Widget/bottom_navigate.dart';
import '../Widget/home_banner.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  final List<Map<String, String>> brands = [
    {"image": "images/hm.png", "name": "H&M"},
    {"image": "images/zara.png", "name": "Zara"},
    {"image": "images/placeholder.png", "name": "Lacoste"},
    {"image": "images/hm.png", "name": "Ralph L"},
    {"image": "images/hm.png", "name": "Pull & Bear"},
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  void fetchProducts() async {
    final apiService = ApiServices();
    final data = await apiService.getProducts();

    setState(() {
      products = data.cast<Product>();
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 24 ,),
         child: Column(
           children: [
             SizedBox(height: 27,),
             Row(
               children: [
                 Image.asset("images/logo.png" , height: 30,width: 100,),
                 Spacer(),
                 MyIconButton(icon: Icons.search, pressed: (){}),
                 SizedBox(width: 10,),
                 MyIconButton(icon: Icons.shopping_bag_outlined, pressed: (){}),
               ],
             ),
             SizedBox(height: 24,),
             Container(
               height: 50,width: double.infinity,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 border: BoxBorder.all(
                   width: 1, color: Color(0x1F1F1F14)
                 )
               ),
               child: Row(
                 children: [
                   CircleAvatar(
                     backgroundColor: Color(0x1F1F1F0A),
                     radius: 24,
                     child: Icon(Icons.location_on_outlined, color: Color(0xFF015B8A)),
                   ),
                   SizedBox(width: 8),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Send To", style: TextStyle(
                           color: Color(0x1F1F1F14),fontSize: 12,
                         ),
                       ),
                       SizedBox(height: 2),
                       Text("Brisbane, Queensland", style: TextStyle(
                           color: wordColor, fontSize: 14,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     ],
                   ),
                   Spacer(),
                   Container(
                     width: 92, height: 43,
                     alignment: Alignment.center,
                     decoration: BoxDecoration(
                       color: Color(0xFF015B8A),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Text("Change", style: TextStyle(
                         fontSize: 16, color: Colors.white,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                   ),
                 ],
               )
             ),
             SizedBox(height: 20,),
             HomeBanner(),
             SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Popular Brand", style: TextStyle(
                   fontSize: 20, color: wordColor,
                   fontWeight: FontWeight.w500,
                 ),
                 ),
               ],
             ),
             SizedBox(height: 10,),
             SizedBox(
               height: 130,
               child: ListView.builder(
                 itemCount: widget.brands.length,
                 scrollDirection: Axis.horizontal,
                   itemBuilder: (context , index) {
                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                   child: Brand(
                     imagePath: widget.brands[index]["image"]!,
                     brandName: widget.brands[index]["name"]!,
                   ),
                 );
               }),
             ),
             SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Text("Flash Sale", style: TextStyle(
                   fontSize: 20, color: wordColor,
                   fontWeight: FontWeight.w500,
                 ),
                 ),
                 Spacer(),
                 Text("Ends at", style: TextStyle(
                   fontSize: 14, color: Color(0x1F1F1FA3),
                   fontWeight: FontWeight.w500,
                 ),
                 ),
                 SizedBox(width: 10,),
                 Container(
                   height:30 ,width:107 ,
                   alignment: Alignment.center,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(15),
                     color: Color(0xFFE62B3B)
                   ),
                   child: Text("1 : 24 : 02" , style: TextStyle(
                     color: Colors.white , fontSize: 14
                   ),),
                 )
               ],
             ),
             SizedBox(height: 10,),
             GridView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 10,
                 mainAxisSpacing: 10,
                 childAspectRatio: 0.75,
               ),
               itemCount: products.length,
               itemBuilder: (context, index) {
                 final product = products[index];
                 return GestureDetector(
                   onTap: () {
                     Navigator.push(context,
                       MaterialPageRoute(
                         builder: (_) => ProductDetails(product: product),
                       ),
                     );
                   },
                   child: Hero(
                     tag: product.image,
                     child: Container(
                       padding: EdgeInsets.all(8),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color: Colors.white,
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Expanded(
                             child: Image.network(product.image, fit: BoxFit.cover,
                             ),
                           ),
                           SizedBox(height: 8),
                           Row(
                             children: [
                               Expanded(
                                 child: Text(product.title, maxLines: 2,
                                   overflow: TextOverflow.ellipsis, style: TextStyle(
                                     color: wordColor, fontSize: 13,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                               ),
                               SizedBox(width: 4),
                               Image.asset("images/star.png", height: 16),
                               SizedBox(width: 4),
                               Text(product.rating.rate.toString(),
                                 style: TextStyle(fontSize: 12),
                               ),
                             ],
                           ),
                           SizedBox(height: 6),
                           Text("\$${product.price}", style: TextStyle(
                               color: wordColor, fontSize: 16,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 );
               },
             ),
           ],
         ),
       ),
     ),
    );
  }
}
