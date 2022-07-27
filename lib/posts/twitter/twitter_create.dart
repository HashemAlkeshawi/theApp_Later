import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class TwitterCreate extends StatefulWidget {
  static const String screenName = "TwitterCreate";

  @override
  State<TwitterCreate> createState() => _TwitterCreateState();
}

class _TwitterCreateState extends State<TwitterCreate> {
  TextEditingController contentController = TextEditingController();

  File? selectedImage;

  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImage = File(file!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    ////////////
    FocusNode inputNode = FocusNode();
    void openKeyboard() {
      FocusScope.of(context).requestFocus(inputNode);
    }

////////////
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00ACEE),
        title: Text("NTPost".tr()),
      ),
      body: Container(
        padding: EdgeInsets.all(12.h),
        height: screenHeight,
        child: ListView(
          children: [
            TextField(
              keyboardType: TextInputType.values[0],
              focusNode: inputNode,
              controller: contentController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "TCH".tr(),
              ),
            ),
            Container(
              child: selectImage(selectedImage),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          height: 100.h,
          child: Column(
            children: [
              const Divider(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      getImage();
                    },
                    icon: Image.asset('assets/images/addImage.png'),
                  ),
                  IconButton(
                    onPressed: () {
                      openKeyboard();
                    },
                    icon: Image.asset('assets/images/smile.png'),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff00ACEE),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        height: 60.h,
                        width: 250.w,
                        child: Center(
                          child: Text(
                            "saveTweet".tr(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ))
                ],
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
