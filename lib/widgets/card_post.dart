import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app/configs/colors.dart';
import '../app/configs/theme.dart';
import '../app/resources/constant/named_routes.dart';
import '../data/post_model.dart';
import '../view/chat_screen.dart';
import 'clip_status_bar.dart';
import 'custom_bottom_sheet_comments.dart';

class CardPost extends StatefulWidget {
  final  post;


  const CardPost({required this.post, Key? key}) : super(key: key);

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  bool follow = false;
  bool save = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 380,
      margin: const EdgeInsets.only(bottom: 24),
      child: Stack(
        children: [
          _buildImageCover(),
          _buildImageGradient(),
          Positioned(
            height: 300,
            width: 85,
            right: 0,
            top: 40,
            child: Transform.rotate(
              angle: 3.14,
              child: ClipPath(
                clipper: ClipStatusBar(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: ColoredBox(
                    color: AppColors.whiteColor.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 75,
            right: 15,
            child: Column(
              children: [
                const SizedBox(height: 10),
                ..._itemStatus(
                    "assets/images/follow.svg", 'Follow', context),
                const SizedBox(height: 10),
                ..._itemStatus(
                    "assets/images/message.svg", 'Contact', context),
                const SizedBox(height: 10),
                ..._itemStatus(
                    "assets/images/save.svg", "Save", context),

              ],
            ),
          ),
          Positioned(
            width: 5,
            height: 30,
            right: 75,
            top: 180,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          _buildItemPublisher(context),
        ],
      ),
    );
  }

  Align _buildImageGradient() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.2),
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Stack(children: [
        BlurHash(
          imageFit: BoxFit.cover,
          hash: widget.post.pictureHash,
        ),
        Image.asset(
          widget.post.picture,
          width: double.infinity,
          fit: BoxFit.cover,

        )
      ]),
    );
  }

  Container _buildItemPublisher(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 18, right: 40, bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(NamedRoutes.profileScreen,arguments: false),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    widget.post.imgProfile,
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.post.name,
                  style: AppTheme.whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: AppTheme.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.post.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTheme.whiteTextStyle.copyWith(
              fontSize: 12,
              fontWeight: AppTheme.regular,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            widget.post.hashtags.join(" "),
            style: AppTheme.whiteTextStyle.copyWith(
              color: AppColors.greenColor,
              fontSize: 12,
              fontWeight: AppTheme.medium,
            ),
          ),
        ],
      ),
    );
  }

  _itemStatus(String icon, String text, BuildContext context) => [
    GestureDetector(
      onTap: (){
        if(text == 'Contact') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPage(),));
        }

        else if(text == 'Follow'){
          setState(() {
            follow = !follow;
          });
        }
        else if(text == 'Save'){
          setState(() {
            save = !save;
          });
        }


  },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.whiteColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),

        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            width: 20,
            height: 20,
            color: text == 'Follow' && follow == true ? Colors.red : text == 'Save' && save == true ? Colors.blueAccent :AppColors.whiteColor ,
          ),
        ),
      ),
    ),
    const SizedBox(height: 4),
    Text(
      text,
      style: AppTheme.whiteTextStyle.copyWith(
        fontSize: 12,
        fontWeight: AppTheme.regular,
      ),
    ),
  ];
}
