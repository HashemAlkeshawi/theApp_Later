// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/posts/facebook/F_Post.dart';
import 'package:later/widgets/post_summary.dart';

import '../../widgets/Feeling.dart';

class FacePost extends StatelessWidget {
  static const String screenName = "Face_Post";

  String? imagePath;

  F_Post post;
  FacePost(this.post);

  @override
  Widget build(BuildContext context) {
    String creationDate = DateFormat.yMMMMEEEEd().format(post.creationTime!);
    String? feeling = post.feeling;
    String content = post.content!;
    String? imagePath = post.imagePath;
    String typeImage = post.typeImage();
    DateTime? dueOn = post.dueOn;
    bool isTimed = post.isTimed;

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
                child: Text(content),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 18.h),
                child: imagePath == null || imagePath == ''
                    ? const SizedBox()
                    : Image.file(File(imagePath)),
              ),
              Divider(),
              Row(
                children: [Text("lastUpdate".tr()), Text(creationDate)],
              ),
              SizedBox(height: 20.h),
              Container(
                margin: EdgeInsets.only(bottom: 150.h),
                child: sharingDate(isTimed, dueOn),
              ),
            ],
          )),
    );
  }
}
