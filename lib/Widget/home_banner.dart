import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF015B8A),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 25,left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("50% Off Today", style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold,
                    height: 1 , color: Colors.white
                ),),
                SizedBox(height: 5,),
                Text("Limited-time picks", style: TextStyle(
                    fontSize: 16, color: Colors.white
                ),),
                Text("just for you", style: TextStyle(
                    fontSize: 16, color: Colors.white
                ),),
                SizedBox(height: 15,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 33),
                        backgroundColor: Colors.white,
                        elevation: 0
                    ),
                    onPressed: (){},
                    child: Text("Shop Now" , style: TextStyle(
                        fontSize: 15 , color: Color(0xFF5B8AD1),
                    ),)
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0, right: -30,
            child: SizedBox(
              width: 250,
              child: Image.asset("images/screen.png" , fit: BoxFit.contain,),
            ),
          ),
        ],
      ),
    );
  }
}
