import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_experts/view/chat_screen.dart';

import '../data/userData.dart';

class MessangerScreene extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        titleSpacing: 20,
        title:
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/amine.jpg'),
              radius: 20,
            ),
          SizedBox(
            width:15,
          ),
          Text(
          'Chats',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,

          ),
        ),
          ],
        ),
        actions:
        [
          IconButton(onPressed: (){},
             icon: CircleAvatar(
               backgroundColor: Colors.grey.withOpacity(.3),
               radius:16,
               child: Icon(
                 Icons.camera_alt,
                 color: Colors.black,
                 size: 18,
               ),
             ),
         ),
          IconButton(onPressed: (){},
              icon: CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(.3),
                radius: 16,
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size:18,
                ),
              ),
          ),
        ],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          scrollDirection:Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.3)
              ),
                padding:EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                        Icons.search,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize:18,
                      ),
                    ),
                  ],
                ),
            ),

              SizedBox(
                height: 30,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap:true ,
                scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                    return BuildChatItem(data: personalInfoList[index], context: context);
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(
                      height: 15,
                    );

                  },
                  itemCount: personalInfoList.length,
              ),





       
                 ],
              ),
        ),

        ),


    );
  }

  Widget BuildChatItem({
    required UserData data,
    required BuildContext context,
}){


    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(),));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(
              end: 10,
            ),
            child:Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(data.image),
                  radius: 30,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3,
                    end: 3,
                  ),
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3,
                    end: 3,

                  ),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Expanded(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 data.fullName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You : hello can u help me ?',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                        '12:20am',
                      style: TextStyle(
                        fontSize: 14,

                      )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget BuildUsersItem(){
    return Container(
      width: 60,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/2t6zF2x8-Vl4Xz5BLXCDFhdnccKvExI1d-EtkDV_9DkWlL11ZIJvRcutkawyQSxw66_R'),
                radius: 30,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3,
                  end: 3,
                ),
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3,
                  end: 3,

                ),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'monkey di luffy',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

