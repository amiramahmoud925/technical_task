import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170, width: double.infinity,
      child: Stack(
        children: [
          Shimmer.fromColors(
            baseColor: Color(0xFF015B8A),
            highlightColor: Color(0xFF3A8FBF),
            child: Container(
              width: double.infinity, height: 170,
              color: Color(0xFF015B8A),
            ),
          ),
          Positioned(
            top: 25,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("50% Off Today", style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold,
                    height: 1, color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text("Limited-time picks",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text("just for you",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 33),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: Text("Shop Now", style: TextStyle(
                      fontSize: 15, color: Color(0xFF5B8AD1),
                    ),
                  ),
                )
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            right: -30,
            child: SizedBox(
              width: 250,
              child: Image.asset("images/screen.png", fit: BoxFit.contain,),
            ),
          ),
        ],
      ),
    );
  }
}
