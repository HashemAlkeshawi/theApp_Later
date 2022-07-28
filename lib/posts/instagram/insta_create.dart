import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:later/posts/instagram/I_post.dart';

import '../../DataStorage/DB_Helper.dart';
import '../../widgets/saveDialog.dart';

class InstaCreate extends StatefulWidget {
  static const String screenName = "FaceCreate";

  @override
  State<InstaCreate> createState() => _InstaCreateState();
}

class _InstaCreateState extends State<InstaCreate> {
  TextEditingController contentController = TextEditingController();

  String? selectedFeeling;
  String? imagePath;
  DateTime? dueOn;
  bool isTimed = false;

  void dateTimePicker() {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(2023, 12, 31),
        onChanged: (v) {}, onConfirm: (date) {
      dueOn = date;
      isTimed = true;
      savePost(false);
      print(dueOn);
      Navigator.pop(context);
      Navigator.pop(context);
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  void savePost(bool pop) {
    I_Post post = I_Post(
      type: 2,
      content: contentController.text,
      creationTime: DateTime.now(),
      imagePath: selectedImage == null ? '' : selectedImage!.path,
      dueOn: DateTime.now(),
      isTimed: isTimed,
    );

    DbHelper.dbHelper.iInsertNewPost(post);
    if (pop) {
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  File? selectedImage;

  getImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    selectedImage = File(file!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "NIPost".tr(),
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => saveDialog(savePost, dateTimePicker));
              },
              icon: Icon(
                Icons.done,
                color: Colors.black,
                size: 40.h,
              ))
        ],
      ),
      body: Container(
          padding: EdgeInsets.all(12.h),
          height: screenHeight,
          child: ListView(
            children: [
              InkWell(
                onTap: () => getImage(),
                child: selectImage(selectedImage),
              ),
              Container(
                height: 200.h,
                margin: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: TextField(
                  controller: contentController,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "ICH".tr(),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

selectImage(File? image) {
  Widget? widget;
  image == null
      ? widget = Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          margin: EdgeInsets.all(12.r),
          height: 400.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PaI".tr(),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Icon(
                  Icons.add,
                  color: Colors.grey,
                  size: 40.r,
                ),
              ],
            ),
          ),
        )
      : widget = Image.file(
          image,
          fit: BoxFit.contain,
        );
  return widget;
}
