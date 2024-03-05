import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/configs/colors.dart';

Widget PremuimOffer({
  required String text,
  required String price,
  required bool selected,
  required Function pressed,

})=>Expanded(
  child: MaterialButton(
    padding: EdgeInsets.zero,
    onPressed: (){
      pressed();
    },
    child: Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(

            decoration: BoxDecoration(
              color: selected ? AppColors.primaryColor.withOpacity(0.5) : Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),

            height: 25,
            child: Center(child: Text(text,
              style: TextStyle(color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),)),
          ),
        ),
        Container(
          height: 120,
          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: selected ? AppColors.primaryColor : Colors.grey,
                  width: 2
              )
          ),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(price,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                ),),
              SizedBox(height: 20,),
            ],
          )),
        ),

      ],
    ),
  ),
);


Widget PremuimCard({
  required IconData icon,
  required Color iconColor,
  required String title,

})=>Expanded(
  child: Container(
    height: 35,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: Colors.grey,
            width: 1.5
        )
    ),
    child: Center(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
          color: iconColor,
          size: 20,
        ),
        SizedBox(width: 15,),
        Text(title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w600
        ),),
      ],
    )),
  ),
);
Widget Secure({
  required String text,
})=>Text(text,style: TextStyle(
  color: Colors.grey,
  fontSize: 18,
  fontWeight: FontWeight.w600
),);
