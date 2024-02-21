import 'package:flutter/material.dart';
import 'package:marketing_experts/view/HomeLayout.dart';

import 'package:marketing_experts/view/home_page.dart';
import 'package:marketing_experts/view/profile_page.dart';
import 'package:marketing_experts/view/ranking_screen.dart';

import 'app/configs/theme.dart';
import 'app/resources/constant/named_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case NamedRoutes.homeScreen:
            return MaterialPageRoute(builder: (context) =>  HomeLayout());
          case NamedRoutes.profileScreen:
            return MaterialPageRoute(
              builder: (context) =>  ProfilePage(personal: settings.arguments as bool,),
            );
          default:
            return MaterialPageRoute(builder: (context) =>  HomeLayout());
        }
      },
    );
  }
}
