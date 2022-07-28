import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/widgets/post_summary.dart';

import '../DataStorage/Temp.dart';
import '../appRouter.dart';
import '../posts/facebook/face_post.dart';
import '../posts/instagram/insta_post.dart';
import '../posts/twitter/twitter_post.dart';
import '../widgets/BottomNavigatonBar.dart';

class Home extends StatefulWidget {
  static const String ScreenName = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listOfPosts_ = [];
  List listOfPosts_r = [];

  setState_() {
    setState(() {});
  }

  List? posts = [];

  getPosts() {
    posts = ListOfPosts;

    setState(() {});
  }

  Timer? timer;

  @override
  void initState() {
    super.initState();
    // timer =
    //     Timer.periodic(const Duration(minutes: 1), (Timer t) => setState_());
  }

  @override
  Widget build(BuildContext context) {
    listOfPost();
    getPosts();
    int postsCount = 0;

    listOfPosts_ = posts!.where((element) {
      return element.isTimed;
    }).toList();

    listOfPosts_.sort(((a, b) {
      return a.dueOn!.compareTo(b.dueOn!);
    }));

    listOfPosts_.length > 4
        ? listOfPosts_r = listOfPosts_.sublist(0, 4)
        : listOfPosts_r = listOfPosts_;

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
                SizedBox(
                  width: screenWidth,
                  height: screnHeight / 1.55,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      dynamic post = listOfPosts_[index];
                      return InkWell(
                          onTap: () {
                            AppRouter.NavigateToWidget(selectType(post));
                          },
                          child: DSPost(post, screenWidth));
                    },
                    itemCount: listOfPosts_.length,
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
        screenName: Home.ScreenName,
        screen_width: screenWidth,
      ),
    );
  }
}

Widget selectType(dynamic post) {
  switch (post.type) {
    case 1:
      return FacePost(post);
    case 2:
      return InstaPost(post);
    case 3:
      return TwitterPost(post);
  }
  return Text("no widget defined");
}
