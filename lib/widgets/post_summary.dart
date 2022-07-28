import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DSPost extends StatefulWidget {
  dynamic post;
  double screenWidth;
  DSPost(this.post, this.screenWidth);

  @override
  State<DSPost> createState() => _DSPostState();
}

class _DSPostState extends State<DSPost> {
  setState_() {
    setState(() {});
  }

  Timer? timer;
  @override
  void initState() {
    mounted
        ? {
            super.initState(),
            timer = Timer.periodic(
                const Duration(minutes: 1), (Timer t) => setState_())
          }
        : {};
  }

  @override
  Widget build(BuildContext context) {
    String content = widget.post.content!;
    String imagePath = widget.post.imagePath!;
    String typeImage = widget.post.typeImage();
    String? stillTime = widget.post.isTimed ? widget.post.stillTime() : null;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
      width: widget.screenWidth - 80.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all((12.0).r),
      child: Column(
        children: [
          dueOn(stillTime),
          SizedBox(
            child: imagePreview(imagePath),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(child: Text(properContent(content))),
              CircleAvatar(
                radius: 50.r,
                backgroundColor: Colors.transparent,
                child: Image.asset(
                  typeImage,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DSMessages extends StatelessWidget {
  int index;
  double screenWidth;
  DSMessages(this.index, this.screenWidth);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
      width: screenWidth - 80.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(97),
      ),
      padding: EdgeInsets.all((50.0).r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            child: Text("this is sample text \nFacebook content"),
          ),
          SizedBox(
            height: 70.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                child: Text("To: xxx-xxxxxxxxx"),
              ),
              Spacer(),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 40.r,
                child: Image.asset("assets/images/whatsapp.png"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget dueOn(String? stillTime) {
  Widget widget;
  stillTime == null
      ? widget = const SizedBox()
      : widget = Text('${"Due on".tr()}$stillTime');
  return widget;
}

properContent(String? content) {
  String? properContent;
  content == null
      ? properContent = content
      : content.length > 60
          ? properContent = "${content.substring(0, 59)}.."
          : properContent = content;

  return properContent;
}

Widget sharingDate(bool isTimed, DateTime? dueOn) {
  Widget widget;
  widget = isTimed
      ? Row(
          children: [
            Text("SharingDate".tr()),
            Text(DateFormat.jm().add_yMMMEd().format(dueOn!))
          ],
        )
      : const SizedBox();

  return widget;
}

imagePreview(String path) {
  Widget widget;
  path.isEmpty || path == ''
      ? {
          widget = Image.asset('assets/images/twitter.png'),
          print("is emptry or")
        }
      : widget = Image.file(File(path), fit: BoxFit.contain);
  return widget;
}
