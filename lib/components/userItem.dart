import 'package:flutter/material.dart';

import '../data/userData.dart';

Widget BuildUsersItem(
{
  required UserData data,
}
    ){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    width: 100,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: data.live ?Colors.red :Colors.white,
                    width: 2
                  )
                ),

              ),
              backgroundImage: AssetImage(
                  data.image),
              radius: 60,
            ),
            Visibility(
              visible: !data.live,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 12,
                  end: 12,
                ),
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Visibility(
              visible: !data.live,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 14,
                  end: 14,

                ),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ),
            ),
            Visibility(
              visible: data.live,
              child: Positioned(
                bottom: 5,
                right: 20,
                left: 20,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5
                      )
                    ),
                    width: 50,
                    height: 25,
                    padding: EdgeInsets.symmetric(horizontal: 5),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('Live',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            fontWeight: FontWeight.w700
                          ) ,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        Text(
          data.fullName,
          maxLines: 1,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}