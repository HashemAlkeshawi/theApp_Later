import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:later/posts/twitter/T_post.dart';

class TwitterPost extends StatefulWidget {
  static const String screenName = "Twitter_Post";

  T_Post post;
  TwitterPost(this.post);

  @override
  State<TwitterPost> createState() => _TwitterPostState();
}

class _TwitterPostState extends State<TwitterPost> {
  String? imagePath;

  File? selectedImage;

  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImage = File(file!.path);
    setState(() {});
  }

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
                child: selectImage(selectedImage),
              ),
              Row(
                children: [Text("lastUpdate".tr()), Text("The date")],
              )
            ],
          )),
    );
  }
}

selectImage(File? image) {
  Widget? widget;
  image == null
      ? widget = const SizedBox()
      : widget = Image.file(
          image,
          fit: BoxFit.contain,
        );
  return widget;
}
