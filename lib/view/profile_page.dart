import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_experts/bloc/diplome_profile_cubit.dart';
import 'package:marketing_experts/view/premuim_screen.dart';

import '../app/configs/colors.dart';
import '../app/configs/theme.dart';
import '../bloc/diplome_profile_state.dart';
import '../bloc/gallery_profile_cubit.dart';
import '../components/userItem.dart';
import 'chat_screen.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.personal}) : super(key: key);
  final bool personal;


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool follow = false;
  int index = 0;
  bool status = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
            color: AppColors.blackColor,
          ),
        ),
        title: Text(
          'Amine Ennour',
          style: AppTheme.blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: AppTheme.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.more_horiz_rounded,
            size: 24,
            color: AppColors.blackColor,
          ),
          SizedBox(width: 24),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImageProfile(),
                const SizedBox(height: 16),
                Text(
                  "@Amine_Ennour",
                  style: AppTheme.blackTextStyle.copyWith(
                    fontWeight: AppTheme.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 24),
                _buildDescription(),

                Visibility(
                  visible: !widget.personal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: _buildButtonAction(),
                    )),
                const SizedBox(height: 25),
                _buildTabBar(),
                const SizedBox(height: 10),
                index == 0 ? _buildGridList(context) : index == 1 ?_buildGridListVedio(context) : _buildGridListDiplome(context) ,

              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocProvider<GalleryProfileCubit> _buildGridList(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryProfileCubit()..getGalleryProfile(),
      child: BlocBuilder<GalleryProfileCubit, GalleryProfileState>(
        builder: (_, state) {
          if (state is GalleryProfileError) {
            return Center(child: Text(state.message));
          } else if (state is GalleryProfileLoaded) {
            return SizedBox(
              height: 400,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 0.62,
                physics: const BouncingScrollPhysics(),
                children: state.galleryProfiles
                    .map((gallery) => MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    if(gallery.premium == false || status == true){
                      showDialog(
                          context: context,
                          builder: (BuildContext dialogContext)
                          {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 20,vertical: MediaQuery.of(context).size.height * 0.15),

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:  Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, icon: Icon(CupertinoIcons.xmark,color: Colors.black,size: 25,)),
                                      ],
                                    ),
                                    Center(
                                      child: Container(
                                        child: Image.asset(
                                          gallery.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),

                              ),
                            );
                          });
                    }
                    else{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PremuimScreen(),)).then((value) {
                        setState(() {
                          status = value;
                        });
                      });
                    }
                  },
                      child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      gallery.image,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),

                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: gallery.premium && status == false ?5.0:00,
                                        sigmaY: gallery.premium && status == false ?5.0:00),
                                    child: Container(
                                      color: Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !gallery.premium || status == true,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 10,
                                  ),
                                  margin: const EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Text(
                                    gallery.like,
                                    style: AppTheme.blackTextStyle.copyWith(
                                        fontWeight: AppTheme.bold, fontSize: 10),
                                  ),
                                ),
                              ),


                              Visibility(
                                visible: gallery.premium && status == false,
                                child: Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                      size: 36,
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                    ))
                    .toList(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  BlocProvider<GalleryProfileCubit> _buildGridListVedio(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryProfileCubit()..getGalleryProfile(),
      child: BlocBuilder<GalleryProfileCubit, GalleryProfileState>(
        builder: (_, state) {
          if (state is GalleryProfileError) {
            return Center(child: Text(state.message));
          } else if (state is GalleryProfileLoaded) {
            return SizedBox(
              height: 400,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 0.62,
                physics: const BouncingScrollPhysics(),
                children: state.galleryProfiles
                    .map((gallery) => Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                  image: AssetImage(
                                    gallery.image,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 10,
                              ),
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Text(
                                gallery.like,
                                style: AppTheme.blackTextStyle.copyWith(
                                    fontWeight: AppTheme.bold, fontSize: 10),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  BlocProvider<DiplomeProfileCubit> _buildGridListDiplome(BuildContext context) {
    return BlocProvider(
      create: (context) => DiplomeProfileCubit()..getDiplomeProfile(),
      child: BlocBuilder<DiplomeProfileCubit, DiplomeProfileState>(
        builder: (_, state) {
          if (state is DiplomeProfileError) {
            return Center(child: Text(state.message));
          } else if (state is DiplomeProfileLoaded) {
            return SizedBox(
              height: 400,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 2.4,
                physics: const BouncingScrollPhysics(),
                children: state.diplomeProfiles
                    .map((diplome) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    MaterialButton(
                      onPressed: (){


                        showDialog(
                            context: context,
                            builder: (BuildContext dialogContext)
                            {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: MediaQuery.of(context).size.height * 0.28),

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(onPressed: (){
                                            Navigator.pop(context);
                                          }, icon: Icon(CupertinoIcons.xmark,color: Colors.black,size: 25,)),
                                        ],
                                      ),
                                      Center(
                                        child: Container(
                                          child: Image.network(
                                            diplome.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),

                                ),
                              );
                            });

                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.dashedLineColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              diplome.image,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),

                      ),
                    ),

                  ],
                ))
                    .toList(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Row _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: (){
            setState(() {
              index = 0;
            });

          },
          child: Text(
            "Photos",
            style: AppTheme.blackTextStyle.copyWith(
              fontWeight: AppTheme.bold,
              fontSize: 18,
              color: index == 0 ? Colors.black :AppColors.greyColor,
            ),
          ),
        ),
        const SizedBox(width: 24),
        TextButton(
          onPressed: (){
            setState(() {
              index = 1;
            });

          },
          child: Text(
            "Video",
            style: AppTheme.blackTextStyle.copyWith(
              fontWeight: AppTheme.bold,
              fontSize: 18,
              color: index == 1 ? Colors.black :AppColors.greyColor,
            ),
          ),
        ),
        const SizedBox(width: 24),
        TextButton(
          onPressed: (){
            setState(() {
              index = 2;
            });


        },

          child: Text(
            "Diploma",
            style: AppTheme.blackTextStyle.copyWith(
              fontWeight: AppTheme.bold,
              fontSize: 18,
              color: index == 2 ? Colors.black :AppColors.greyColor,
            ),
          ),
        ),
        const Spacer(),
        Image.asset("assets/images/ic_dots_2.png", width: 32),
      ],
    );
  }

  Row _buildButtonAction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(

          padding: EdgeInsets.symmetric(vertical: 1,horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: follow == true ? AppColors.greenColor : Colors.white,

          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                follow = !follow;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: follow == false ?  AppColors.greenColor : Colors.white,
              minimumSize: const Size(120, 45),
              elevation: 8,
              shadowColor: AppColors.primaryColor.withOpacity(0.3) ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Follow',
                style: AppTheme.whiteTextStyle
                    .copyWith(fontWeight: AppTheme.semiBold,
                color: follow == true ? AppColors.greenColor : Colors.white)),
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                 ChatPage(),));
          },
          icon: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyColor.withOpacity(0.17),
              image: const DecorationImage(
                scale: 2.3,
                image: AssetImage("assets/images/ic_inbox.png"),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row _buildDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "121.9k",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Followers",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.regular,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "7.5M",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Likes",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.regular,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "29",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Posts",
              style: AppTheme.blackTextStyle.copyWith(
                fontWeight: AppTheme.regular,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),


      ],
    );
  }

  Container _buildImageProfile() {
    return Container(
      width: 130,
      height: 130,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.dashedLineColor,
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Image.asset(
          "assets/images/amine.jpg",

          width: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
