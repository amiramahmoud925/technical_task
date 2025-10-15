import 'package:flutter/material.dart';
class Brand extends StatelessWidget {
  final String imagePath;
  final String brandName;
  const Brand({super.key, required this.imagePath, required this.brandName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(0xFFF9F9F9),
          radius: 40,
          child: Image.asset(imagePath ,fit: BoxFit.cover,),
        ),
        SizedBox(height: 10,),
        Text(brandName , style: TextStyle(
            fontSize: 14, color: Color(0xFF1F1F1F)
        ),),
      ],
    );
  }
}
