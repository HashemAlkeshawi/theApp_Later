import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/posts/facebook/F_Post.dart';
import 'package:later/widgets/post_summary.dart';

import '../DataStorage/Temp.dart';
import '../appRouter.dart';
import '../posts/PostArchiticture.dart';
import '../posts/facebook/face_post.dart';
import '../posts/instagram/I_post.dart';
import '../posts/instagram/insta_post.dart';
import '../posts/twitter/T_post.dart';
import '../posts/twitter/twitter_post.dart';
import '../widgets/BottomNavigatonBar.dart';

class Home extends StatelessWidget {
  static const String ScreenName = "Home";

  @override
  Widget build(BuildContext context) {
    double screnHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1F97CF),
        title: Text(
          "Home".tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DSPosts".tr(),
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: (24.0).sp,
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: screnHeight / 1.55,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      PostMaster post = listOfPosts[index];
                      return InkWell(
                          onTap: () {
                            AppRouter.NavigateToWidget(selectType(post));
                          },
                          child: DSPost(post, screenWidth));
                    },
                    itemCount: listOfPosts.length,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DSMessages".tr(),
                  style: TextStyle(
                    color: Color(0xff707070),
                    fontSize: (24.0).sp,
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: screnHeight / 2.4,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return DSMessages(index, screenWidth);
                    },
                    itemCount: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: buttomNavigationBar(
        screenName: ScreenName,
        screen_width: screenWidth,
      ),
    );
  }
}

Widget selectType(PostMaster post) {
  switch (post.runtimeType) {
    case F_Post:
      return FacePost(post as F_Post);
    case I_Post:
      return InstaPost(post as I_Post);
    case T_Post:
      return TwitterPost(post as T_Post);
  }
  return Text("no widget defined");
}
