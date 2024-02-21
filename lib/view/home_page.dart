import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketing_experts/components/userItem.dart';


import '../app/configs/colors.dart';
import '../app/configs/theme.dart';
import '../bloc/post_cubit.dart';
import '../data/userData.dart';
import '../widgets/card_post.dart';
import '../widgets/clip_status_bar.dart';
import '../widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                const SizedBox(height: 12),
                _buildCustomAppBar(context),
                const SizedBox(height: 12),


                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index)
                            {
                              UserData userData = personalInfoList[index];
                              return BuildUsersItem(data: userData );
                            },
                            separatorBuilder: (context,index){
                              return SizedBox(
                                width: 0,
                              );
                            },
                            itemCount: personalInfoList.length,



                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                          child: Column(
                            children: [
                              BlocProvider(
                                create: (context) => PostCubit()..getPosts(),
                                child: BlocBuilder<PostCubit, PostState>(
                                  builder: (context, state) {
                                    if (state is PostError) {
                                      return Center(child: Text(state.message));
                                    } else if (state is PostLoaded) {

                                      return Column(
                                        children: state.posts
                                            .map((post) => GestureDetector(
                                          child: CardPost(post: post,),
                                        ))
                                            .toList(),
                                      );
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildBackgroundGradient(),
          // Positioned(
          //   bottom: 91,
          //   child: Transform.rotate(
          //     angle: 11,
          //     child: ClipPath(
          //       clipper: ClipStatusBar(),
          //       child: Container(
          //         height: 110,
          //         width: 40,
          //         color: AppColors.blackColor,
          //         child: const Icon(
          //           Icons.add,
          //           size: 24,
          //           color: AppColors.whiteColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

        ],
      ),
    );
  }



  _buildBackgroundGradient() => Container(
    width: double.infinity,
    height: 150,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        AppColors.whiteColor.withOpacity(0),
        AppColors.whiteColor.withOpacity(0.8),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    ),
  );

  CustomAppBar _buildCustomAppBar(BuildContext context) {
    return CustomAppBar(
      child: Row(
        children: [
          const SizedBox(width: 8),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.2),
                  blurRadius: 35,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/logo.jpg',
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Image.asset("assets/images/ic_notification.png",
              width: 24, height: 24),
          const SizedBox(width: 12),
          Image.asset("assets/images/ic_search.png", width: 24, height: 24),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: AppColors.backgroundColor,
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.whiteColor,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/amine.jpg",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "M.Amine",
                  style: AppTheme.blackTextStyle
                      .copyWith(fontWeight: AppTheme.bold, fontSize: 12),
                ),
                const SizedBox(width: 2),
                Image.asset(
                  "assets/images/ic_checklist.png",
                  width: 16,
                ),
                const SizedBox(width: 4),
              ],
            ),
          )
        ],
      ),
    );
  }
}
