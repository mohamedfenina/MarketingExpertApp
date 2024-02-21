import 'package:flutter/material.dart';

import '../data/user_ranks.dart';
import '../widgets/rank_component.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {

   @override
  void initState() {
     ranksList.sort((a, b) => b.followers.compareTo(a.followers));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        centerTitle: true,
        title:  Text('Ranking',
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500
        ),),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Container(
            height: 185,
            child: Row(
              children: [
                Expanded(
                  child: RankComponent(rank: 2, name: ranksList[1].fullName, image: ranksList[1].image,followers: ranksList[1].followers),
                ),
                Expanded(
                  child: RankComponent(rank: 1, name: ranksList[0].fullName, image: ranksList[0].image,followers: ranksList[0].followers),
                ),
                Expanded(
                  child: RankComponent(rank: 3, name: ranksList[2].fullName, image: ranksList[2].image, followers: ranksList[2].followers),
                ),
              ],
            ),
            ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20),

              ),



            ),
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text('Rank',style: TextStyle(
                    fontSize:15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),),
                SizedBox(width: 75,),
                Text('User',style: TextStyle(
                    fontSize:15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),),
                Spacer(),
                Text('Followers',style: TextStyle(
                    fontSize:15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54),),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(

                    itemBuilder: (context, index) {
                      UserRanks user = ranksList[index];

                      return Container(
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(width: 15,),
                            Text('${index+1}',style: TextStyle(
                                fontSize:15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54),),
                            SizedBox(width: 30,),
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage(user.image),
                            ),
                            SizedBox(width: 20,),
                            Text(user.fullName,style: TextStyle(
                                fontSize:17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),),
                            Spacer(),
                            Text('${user.followers}',style: TextStyle(
                                fontSize:15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54),),
                            SizedBox(width: 15,),

                          ],
                        ),
                      );

                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Colors.grey.withOpacity(0.5),
                        height: 1,
                      );

                    },
                  itemCount: ranksList.length,),
              ),
            ),
          ),
        ],
      )

    );
  }
}
