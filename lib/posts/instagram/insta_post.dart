import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/posts/instagram/I_post.dart';
import 'package:later/posts/twitter/T_post.dart';

import '../../widgets/Feeling.dart';

class InstaPost extends StatelessWidget {
  static const String screenName = "Insta_Post";

  String? imagePath = 'sample.png.png';

  I_Post post;
  InstaPost(this.post);

  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50.r,
        backgroundImage: AssetImage(
          'assets/images/instagram.png',
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff3F729B),
        title: Text("IP".tr()),
      ),
      body: Container(
          padding: EdgeInsets.all(12.h),
          height: screenHeight,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 18.h),
                child: imagePath == null
                    ? Text("")
                    : Image.asset(
                        'assets/images/$imagePath',
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 18.h),
                padding: EdgeInsets.all(10.r),
                child: const Text("Assume this is a content"),
              ),
              Divider(),
              Row(
                children: [Text("lastUpdate".tr()), Text("The date")],
              )
            ],
          )),
    );
  }
}
