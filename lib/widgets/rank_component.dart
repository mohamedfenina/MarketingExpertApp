import 'dart:math';

import 'package:flutter/material.dart';
import 'package:marketing_experts/app/configs/colors.dart';

Widget RankComponent({
  required int rank,
  required String name,
  required String image,
  required int followers,

})=>Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Container(
      height: 120,
      width: 120,
      child: Stack(
        children: [
          Container(

            margin:  EdgeInsets.all(rank == 1 ? 15 : rank == 2 ? 20 : 25),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),

            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,

            child: Container(
              margin:  EdgeInsets.only(bottom: rank == 1 ? 5 : rank == 2 ? 10 : 15),
                height: 30,
                width: 30,
                child: Hexagon(color: rank == 1 ? Colors.amber :
                rank == 2 ? Colors.grey : Colors.brown,text: '$rank',size: 50,)),
          ),

        ],
      ),
    ),
    SizedBox(height: 4,),
    Text(name,
    style: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600
    ),),
    SizedBox(height: 4,),
    Text('$followers',style: TextStyle(
color:AppColors.primaryColor,
fontSize: 14,
fontWeight: FontWeight.w800
),),
  ],
);


class Hexagon extends StatelessWidget {
  final double size;
  final Color color;
  final String text;

  const Hexagon({super.key, required this.size, required this.color, required this.text});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Center(
          child: Text(text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20
          ),)),
      painter: HexagonPainter(color: color),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color color;

  HexagonPainter({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;

    double radius = size.width / 2;

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();

    for (int i = 0; i < 6; i++) {
      double angle = (pi / 3) * i;
      double x = centerX + radius * cos(angle);
      double y = centerY + radius * sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


