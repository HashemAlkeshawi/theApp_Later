import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:later/posts/instagram/I_post.dart';

import '../../widgets/post_summary.dart';

class InstaPost extends StatelessWidget {
  static const String screenName = "Insta_Post";

  I_Post post;
  InstaPost(this.post);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    String creationDate = DateFormat.yMMMMEEEEd().format(post.creationTime!);
    String content = post.content!;
    String? imagePath = post.imagePath;
    String typeImage = post.typeImage();
    DateTime? dueOn = post.dueOn;
    bool isTimed = post.isTimed;

    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 50.r,
        backgroundImage: AssetImage(
          typeImage,
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
                    ? const SizedBox()
                    : Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 18.h),
                padding: EdgeInsets.all(10.r),
                child: Text(content),
              ),
              Divider(),
              Row(
                children: [
                  Text("lastUpdate".tr()),
                  Text(creationDate),
                  SizedBox(height: 20.h),
                  Container(
                      margin: EdgeInsets.only(bottom: 150.h),
                      child: sharingDate(isTimed, dueOn)),
                ],
              )
            ],
          )),
    );
  }
}
