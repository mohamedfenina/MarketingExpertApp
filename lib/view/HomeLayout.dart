
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketing_experts/view/home_page.dart';
import 'package:marketing_experts/view/profile_page.dart';
import 'package:marketing_experts/view/ranking_screen.dart';

import '../app/configs/colors.dart';
import '../app/resources/constant/named_routes.dart';
import 'messanger_screene.dart';




class HomeLayout extends StatefulWidget {

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {

  var scaffoldKEy =GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  String token = '';
  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    RankingScreen(),
    MessangerScreene(),
    HomePage(),

  ];
  List<String> titles = [
    'Home',
    'Administration',
    'Inventaire',
    'Historiques',
  ];








  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Show a dialog to confirm app exit
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Confirmer la sortie'),
            content: Text('Êtes-vous sûr de vouloir quitter l\'application ?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Non'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Oui'),
              ),
            ],
          ),
        ).then((value) {
          // If the user confirmed, close the app
          if (value == true) {
            SystemNavigator.pop();
          }
        });

        // Always return false to prevent the user from leaving the screen
        return false;
      },
      child: Scaffold(
        key: scaffoldKEy,

        body:
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            screens[currentIndex],
            _buildBottomNavBar(),
          ],
        ),


      ),
    );
  }
  Container _buildBottomNavBar() {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItemBottomNavBar("assets/images/ic_home.png", "Home", currentIndex==0,0),
          _buildItemBottomNavBar(
              "assets/images/ic_discorvery.png", "Discover", currentIndex==1,1),
          _buildItemBottomNavBar("assets/images/ic_inbox.png", "Inbox", currentIndex==2,2),
          _buildItemBottomNavBar(
              "assets/images/ic_profile.png", "Profile", currentIndex==3,3),
        ],
      ),
    );
  }

  _buildItemBottomNavBar(String icon, String title, bool selected,int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: selected ? AppColors.whiteColor : Colors.transparent,
        boxShadow: [
          if (selected)
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.1),
              blurRadius: 35,
              offset: const Offset(0, 10),
            ),
        ],
      ),
      child: MaterialButton(
        onPressed: (){
          setState(() {
            if(index == 3){
              Navigator.of(context).pushNamed(NamedRoutes.profileScreen,arguments:true);
            }
            else{
              currentIndex = index;
            }


          });

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
              color: selected ? AppColors.purpleColor : AppColors.blackColor,
            ),

          ],
        ),
      ),
    );
  }




}
