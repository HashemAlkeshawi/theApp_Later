import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/widgets/post_summary.dart';

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
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15.r, bottom: 15.r, right: 15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screnHeight - 200.h,
                  width: screenWidth,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return DSPost(index, screenWidth);
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
