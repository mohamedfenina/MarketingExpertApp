import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketing_experts/app/configs/colors.dart';
import 'package:marketing_experts/app/configs/theme.dart';

import '../components/userItem.dart';

import '../widgets/premuim_components.dart';

class PremuimScreen extends StatefulWidget {
  const PremuimScreen({super.key});

  @override
  State<PremuimScreen> createState() => _PremuimScreenState();
}

class _PremuimScreenState extends State<PremuimScreen> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height /2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(top: 20),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(CupertinoIcons.xmark,
                      color: Colors.white,
                      size: 25,),
                    ),
                  )
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Unshackle your imaginative sprite',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        PremuimCard(
                         icon: Icons.speed,
                          title: 'Fast Processing',
                          iconColor: Colors.green,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        PremuimCard(
                          icon: Icons.accessibility_new,
                          title: 'Unlimted access',
                          iconColor: Colors.red,
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        PremuimCard(
                          icon: Icons.speed,
                          title: 'upScalling',
                          iconColor: AppColors.primaryColor,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        PremuimCard(
                          icon: Icons.handshake_outlined,
                          title: 'Ad Free',
                          iconColor: Colors.orange,
                        ),

                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    PremuimOffer(
                      pressed: (){
                        setState(() {
                          selected = 0;
                        });
                      },

                      text: 'Weekly',
                      price: '10 \$',
                      selected: selected == 0,
                    ),
                    SizedBox(width: 10,),
                    PremuimOffer(
                      pressed: (){
                        setState(() {
                          selected = 1;
                        });
                      },
                      text: 'Monthly',
                      price: '100 \$',
                      selected: selected == 1,
                    ),
                    SizedBox(width: 10,),
                    PremuimOffer(
                      pressed: (){
                        setState(() {
                          selected = 2;
                        });
                      },
                      text: 'Yearly',
                      price: '220 \$',
                      selected: selected == 2,
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                MaterialButton(
                  padding: EdgeInsets.zero,
                    onPressed: (){

                    Navigator.pop(context,true);

                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.primaryColor.withOpacity(0.5),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child: Center(child: Text('Continue',style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),)),

                )),
                SizedBox(height: 15,),
                Row(
                  children: [
                   Secure(text: 'Terms of Use'),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('|',style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),),

                    Secure(text: 'Privacy Policy'),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('|',style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),),
                    Secure(text: 'Restore'),

                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
