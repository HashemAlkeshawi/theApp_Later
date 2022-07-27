import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:later/posts/facebook/F_Post.dart';

import '../../widgets/saveDialog.dart';

class FaceCreate extends StatefulWidget {
  static const String screenName = "FaceCreate";

  @override
  State<FaceCreate> createState() => _FaceCreateState();
}

class _FaceCreateState extends State<FaceCreate> {
  TextEditingController contentController = TextEditingController();
  Feeling? feeling;
  String? imagePath;

  File? selectedImage;

  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImage = File(file!.path);
    setState(() {});
  }

  void savePost() {}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4267B2),
        title: Text("NFPost".tr()),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => saveDialog(savePost));
              },
              icon: Icon(
                Icons.done,
                size: 40.h,
              ))
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(12.h),
          height: screenHeight,
          child: ListView(
            children: [
              TextField(
                controller: contentController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "FCH".tr(),
                ),
              ),
              Container(
                child: selectImage(selectedImage),
              ),
            ],
          )),
      bottomNavigationBar: SizedBox(
          height: 200.h,
          child: Column(
            children: [
              const Divider(),
              ListTile(
                onTap: () {
                  getImage();
                },
                leading: Image.asset("assets/images/add_photo.png"),
                title: Text("Photo".tr()),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset("assets/images/feeling.png"),
                title: Text("Feeling".tr()),
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
