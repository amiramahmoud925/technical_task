import 'package:flutter/material.dart';
class MyIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback pressed;
  final Color? color;
  const MyIconButton({super.key, required this.icon, required this.pressed, this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          shape: CircleBorder(
            side: BorderSide(
              color: Color(0x1F1F1F14),width: 1,
            ),
          ),
        ),
        onPressed: pressed, icon: Icon(icon , color: Color(0xFF002538),));
  }
}


