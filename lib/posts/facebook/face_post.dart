import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/posts/facebook/F_Post.dart';

import '../../widgets/Feeling.dart';

class FacePost extends StatelessWidget {
  static const String screenName = "Face_Post";

  String? imagePath;

  F_Post post;
  FacePost(this.post);

  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? feeling = post.feeling;
    String content = post.content!;
    String imagePath = post.imagePath!;
    String typeImage = post.typeImage();
    String? stillTime = post.isTimed ? post.StillTime() : null;

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 60.r,
        backgroundImage: AssetImage(
          typeImage,
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xff4267B2),
        title: Text("FP".tr()),
      ),
      body: Container(
          padding: EdgeInsets.all(12.h),
          height: screenHeight,
          child: ListView(
            children: [
              FeelingW(
                emojiName: feeling ?? '',
              ),
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
