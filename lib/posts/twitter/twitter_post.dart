import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/posts/twitter/T_post.dart';

import '../../widgets/Feeling.dart';

class TwitterPost extends StatelessWidget {
  static const String screenName = "Twitter_Post";

  String? imagePath;

  T_Post post;
  TwitterPost(this.post);

  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60.r,
        backgroundImage: AssetImage(
          'assets/images/twitter.png',
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff00ACEE),
        title: Text("TP".tr()),
      ),
      body: Container(
          padding: EdgeInsets.all(12.h),
          height: screenHeight,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 18.h),
                padding: EdgeInsets.all(10.r),
                child: const Text("Assume this is a content"),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 18.h),
                child: imagePath == null
                    ? Text("")
                    : Image.asset('file/images/$imagePath'),
              ),
              Row(
                children: [Text("lastUpdate".tr()), Text("The date")],
              )
            ],
          )),
    );
  }
}
