import 'package:easy_localization/easy_localization.dart';
import 'package:expendable_fab/expendable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/DataStorage/DB_Helper.dart';
import 'package:later/DataStorage/Temp.dart';
import 'package:later/posts/PostArchiticture.dart';
import 'package:later/screens/Home.dart';
import 'package:later/widgets/post_summary.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

import '../appRouter.dart';
import '../posts/facebook/face_create.dart';
import '../posts/instagram/insta_create.dart';
import '../posts/twitter/twitter_create.dart';
import '../widgets/BottomNavigatonBar.dart';

class Posts extends StatefulWidget {
  static const String ScreenName = "Posts";

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<Catigory> catigories = [
    Catigory('All'),
    Catigory('facebook'),
    Catigory('instagram'),
    Catigory('twitter'),
  ];
  List<PostMaster>? posts = [];

  getPosts() async {
    posts = await listOfPosts();
    setState(() {});
  }

  Catigory? selectedCatigory;
  @override
  Widget build(BuildContext context) {
    getPosts();
    double screnHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: ExpendableFab(
        distance: 100.0,
        children: [
          ActionButton(
            onPressed: () => AppRouter.NavigateToWidget(FaceCreate()),
            icon: Image.asset('assets/images/facebook_actionButton.png'),
          ),
          ActionButton(
            onPressed: () => AppRouter.NavigateToWidget(TwitterCreate()),
            icon: Image.asset('assets/images/twitter_actionButton.png'),
          ),
          ActionButton(
            onPressed: () => AppRouter.NavigateToWidget(InstaCreate()),
            icon: CircleAvatar(
                foregroundColor: Colors.white,
                child: Image.asset('assets/images/instagram_actionButton.png')),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff1F97CF),
        title: Text(
          "Posts".tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(8.r),
        height: screnHeight,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
              child: DropdownButton<Catigory>(
                  hint: ListTile(
                    title: Text(catigories.first.catigoryName!),
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                          'assets/images/${catigories.first.catigoryName}.png'),
                    ),
                  ),
                  isExpanded: true,
                  underline: const SizedBox(),
                  value: selectedCatigory,
                  items: catigories.map((e) {
                    return DropdownMenuItem<Catigory>(
                      value: e,
                      child: ListTile(
                        title: Text(e.catigoryName!),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                              'assets/images/${e.catigoryName}.png'),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (v) {
                    selectedCatigory = v;
                    setState(() {});
                  }),
            ),
            SizedBox(
              height: screnHeight - 300.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  PostMaster post = posts![index];
                  return InkWell(
                    onTap: () {
                      AppRouter.NavigateToWidget(selectType(post));
                    },
                    child: SwipeableTile.swipeToTrigger(
                        color: Colors.white,
                        swipeThreshold: 0.5,
                        direction: SwipeDirection.endToStart,
                        onSwiped: (direction) {
                          DbHelper.dbHelper.deleteOnePost(posts![index].id!);
                          setState(() {});
                        },
                        backgroundBuilder: (context, direction, progress) {
                          if (direction == SwipeDirection.endToStart) {
                            return Container(
                              padding: EdgeInsets.only(left: 260.w),
                              height: screnHeight - 250.h,
                              color: Colors.red,
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 60.r,
                              ),
                            );
                          }

                          return Container();
                        },
                        key: UniqueKey(),
                        child: SizedBox(
                            width: screenWidth,
                            child: DSPost(post, screenWidth))),
                  );
                },
                itemCount: posts!.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: buttomNavigationBar(
        screenName: Posts.ScreenName,
        screen_width: screenWidth,
      ),
    );
  }
}

class Catigory {
  String? catigoryName;

  Catigory(this.catigoryName);
}
