import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;
      const MyButton({Key? key,
       required this.onPress,
       required this.title,
       this.color=const Color(0xffa5a5a5)
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: screenWidth*0.028),
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: screenHeight*0.10,
          width: screenWidth*0.19,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child:  Center(child: Text(title,style:   const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
        ),
      ),
    );
  }
}
