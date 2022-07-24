import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/widgets/post_summary.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

import '../widgets/BottomNavigatonBar.dart';

class Posts extends StatelessWidget {
  static const String ScreenName = "Posts";

  @override
  Widget build(BuildContext context) {
    double screnHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1F97CF),
        title: Text(
          "Posts".tr(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        height: screnHeight - 200.h,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return SwipeableTile.swipeToTrigger(
                color: Colors.white,
                swipeThreshold: 0.4,
                direction: SwipeDirection.endToStart,
                onSwiped: (direction) {
                  print("swiped");
                },
                backgroundBuilder: (context, direction, progress) {
                  if (direction == SwipeDirection.endToStart) {
                    return Container(
                      padding: EdgeInsets.only(left: 250.w),
                      height: screnHeight - 250.h,
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 60.r,
                      ),
                    );
                  }
                  //  else if (direction == SwipeDirection.startToEnd) {
                  //   // return your widget
                  // }
                  return Container();
                },
                key: UniqueKey(),
                child: SizedBox(
                    width: screenWidth, child: DSPost(index, screenWidth)));
          },
          itemCount: 5,
        ),
      ),
      bottomNavigationBar: buttomNavigationBar(
        screenName: ScreenName,
        screen_width: screenWidth,
      ),
    );
  }
}
