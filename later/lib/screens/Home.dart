import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/widgets/post_summary.dart';

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
                  height: screnHeight / 1.8,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return DSPost(index, screenWidth);
                    },
                    itemCount: 5,
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
                  height: screnHeight / 2.5,
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
